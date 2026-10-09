local QBCore = exports['qb-core']:GetCoreObject()

-- Certifique-se de que o Config também esteja disponível no servidor
Config = Config or {}
Config.SyncLoot = Config.SyncLoot or false

local serverCooldown = {}

-- Thread para decrementar os cooldowns no servidor
CreateThread(function()
    while true do
        for propKey, time in pairs(serverCooldown) do
            if time > 0 then
                serverCooldown[propKey] = time - 1
            else
                serverCooldown[propKey] = nil
            end
        end
        Wait(1000)
    end
end)

-- Callback para verificar se o saque pode ser iniciado
QBCore.Functions.CreateCallback("pz_loot:canLoot", function(source, cb, prop, type, cooldownTime)
    if Config.SyncLoot and serverCooldown[prop] then
        cb(false)
        return
    end
    if Config.SyncLoot then
        serverCooldown[prop] = cooldownTime
    end
    cb(true)
end)


-- Evento para liberar a entidade em caso de cancelamento do saque
RegisterNetEvent("pz_loot:releaseEntity", function(prop)
    if serverCooldown[prop] then
         serverCooldown[prop] = nil
    end
end)

-- Evento existente para adicionar o item ao jogador
RegisterNetEvent('pz_loot:giveitem', function(item, amount, items)
    local src = source
    if item == Config.fuelItem then
        GiveFuel(src, items)
    else
        exports.ox_inventory:AddItem(src, item, amount)
    end
end)

RegisterNetEvent('pz_loot:removeitem', function(item, amount)
    local src = source
    exports.ox_inventory:RemoveItem(src, item, amount)
end)

lib.callback.register('pz_loot:createDrop', function(source, items)
    local src = source
    local tempStash = exports.ox_inventory:CustomDrop('Itens encontrados', items, GetEntityCoords(GetPlayerPed(src)), #items, 35000, nil, `prop_money_bag_01`)
    return tempStash
end)

function GiveFuel(src, items)
    local fuel = math.random(5, 35)
    local item = nil
    for _, _item in pairs(items) do
        if tonumber(_item.metadata.cdn_fuel) < 100 then
            item = _item
            break
        end
    end
    
    if item then
        local itemData = item
        local currentFuel = tonumber(itemData.metadata.cdn_fuel) or 0
        local newFuel = currentFuel + fuel
        if newFuel > 100 then
            local surplus = newFuel - 100
            newFuel = 100
            -- Remove o jerrycan antigo
            exports.ox_inventory:RemoveItem(src, Config.fuelItem, 1, nil, itemData.slot)
            -- Adiciona o jerrycan com combustível atualizado (100%)
            local info = {
                cdn_fuel = tostring(newFuel),
                weight = CalculateFuelWeight(newFuel)
            }
            exports.ox_inventory:AddItem(src, Config.fuelItem, 1, info)
            -- Adiciona um novo jerrycan com o combustível excedente
            local surplusInfo = {
                cdn_fuel = tostring(surplus),
                weight = CalculateFuelWeight(surplus)
            }
            exports.ox_inventory:AddItem(src, Config.fuelItem, 1, surplusInfo)
        else
            -- Remove o jerrycan antigo e adiciona um novo com o combustível atualizado
            exports.ox_inventory:RemoveItem(src, Config.fuelItem, 1, nil, itemData.slot)
            local info = {
                cdn_fuel = tostring(newFuel),
                weight = CalculateFuelWeight(newFuel)
            }
            exports.ox_inventory:AddItem(src, Config.fuelItem, 1, info)
        end
    else
        -- O player não possui jerrycan, adiciona um novo com o combustível gerado
        local info = {
            cdn_fuel = tostring(fuel),
            weight = CalculateFuelWeight(fuel)
        }
        exports.ox_inventory:AddItem(src, Config.fuelItem, 1, info)
    end
end

function CalculateFuelWeight(fuel)
    local density = 75   -- densidade média da gasolina em g/L
    local weight = math.floor(fuel * density)
    return weight
end

function Webhook()

end

QBCore.Functions.CreateUseableItem('recyclablematerial', function(source, item)
    TriggerClientEvent('pz_loot:CL:openRecicleBox', source, item)
end)