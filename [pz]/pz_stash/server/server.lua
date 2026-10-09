local QBCore = exports['qb-core']:GetCoreObject()
function GenerateRandomCode(length)
    local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local code = ''
    for i = 1, length do
        local randomIndex = math.random(1, #chars)
        code = code .. chars:sub(randomIndex, randomIndex)
    end
    return code
  end
RegisterNetEvent('pz_stash:SV:registerStorage', function(coords, code, insertId)

    local accessItem = nil
    if code then
        accessItem = Config.AccessItem
    end

    local stash = {
        Config.Stash.name, -- name
        nil, -- job
        nil, --gang
        nil, -- rank
        accessItem, -- item
        Config.Stash.slotSize, -- slot size
        Config.Stash.weight, -- weight
        code, -- password
        nil, -- citizenID
        Config.Stash.targetlabel, -- Label
        Config.Stash.webhookURL, -- webhook
    }

    TriggerEvent('insertStashesData', stash, coords, 'storage', code, insertId)
    if code then
        local metatada = {
            storage = code,
            description = 'Padrão de Chave: '..code
        }
        exports.ox_inventory:AddItem(source, Config.AccessItem, 1, metatada)
    end
    exports.ox_inventory:RemoveItem(source, Config.StorageItem, 1)
    lib.notify(source, { title = "Stash", description = 'Báu colocado!', type = 'success', })
    DebugLog('Stash registrado nas coordenadas: ' .. json.encode(coords))
    local player = exports.qbx_core:GetPlayer(source)
    local cid = player.PlayerData.citizenid
    local name = player.PlayerData.name
    local webhookData = ('Stash colocado por: **%s** \n CitizenID: **%s** \n ID: **%s** \n Senha: `%s` \nCoordenadas: ```%s```'):format(name, cid, source, code or 'Sem senha', ('%s, %s, %s'):format(coords.x, coords.y, coords.z))
    exports.zdiscord:log("stashSpawn", webhookData, false, 0xff0000);
end)

exports.qbx_core:CreateUseableItem(Config.StorageItem, function(source, item)
    TriggerClientEvent('objects:client:previewStorage', source, Config.StorageModel, Config.StorageScene, item.metadata.code)
end)

RegisterNetEvent("pz_stash:SV:removeStorage", function(insertId)
    TriggerClientEvent('objects:client:removeObject', -1, insertId)
end)
RegisterNetEvent("pz_stash:SV:transformIntoUpgrade", function(slot)
    local src = source
    local slotData = exports.ox_inventory:GetSlot(src, slot)
    local locker = slotData.metadata.locker
    if locker then
        exports.ox_inventory:AddItem(source, Config.LockItem, 1)
    end
    exports.ox_inventory:RemoveItem(source, Config.StorageItem, 1)
    exports.ox_inventory:AddItem(source, Config.StashUpgrades.item, 10)
end)

RegisterNetEvent("pz_stash:SV:removeStash", function(invId, password)
    TriggerEvent('deleteStashesData', invId)
    if password ~= 0 then
        exports.ox_inventory:AddItem(source, Config.LockItem, 1)
    end
    exports.ox_inventory:AddItem(source, Config.StorageItem, 1)
end)
RegisterNetEvent("pz_stash:SV:upgradeStash", function(invId)
    TriggerEvent('updateStashesData', invId, Config.StashUpgrades.slots, Config.StashUpgrades.weight)

    exports.ox_inventory:RemoveItem(source, Config.StashUpgrades.item, 1)
end)
RegisterNetEvent("pz_stash:SV:lockStash", function(invId)
    print('CALL')
    local code = GenerateRandomCode(12)
    local metatada = {
        storage = code,
        description = 'Padrão de Chave: '..code
    }
    TriggerEvent('lockStash', invId, code, Config.AccessItem)
    exports.ox_inventory:AddItem(source, Config.AccessItem, 1, metatada)
    exports.ox_inventory:RemoveItem(source, Config.LockItem, 1)
end)

RegisterNetEvent("pz_stash:SV:duplicateKey", function(slot)
    local src = source
    local slotData = exports.ox_inventory:GetSlot(src, slot)
    local code = slotData.metadata.storage
    
    local metalscrapCount = exports.ox_inventory:Search(src, 'count', 'metalscrap')
    if metalscrapCount and metalscrapCount > 0 then
        exports.ox_inventory:RemoveItem(src, 'metalscrap', 1)
        local metatada = {
            storage = code,
            description = 'Padrão de Chave: '..code
        }
        exports.ox_inventory:AddItem(src, Config.AccessItem, 1, metatada)
    else
        lib.notify(source, {
            description = 'Eu preciso de 1x Sucata de Metal pra isso.',
            type = 'error'
        })
    end
end)