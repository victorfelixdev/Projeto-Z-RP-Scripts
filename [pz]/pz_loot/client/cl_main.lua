local QBCore = exports["qb-core"]:GetCoreObject()

local function debugLog(msg)
    if Config.Debug then
        print("[DEBUG] " .. msg)
    end
end
local function doShuffle(items)
    local size = #items
    for i = size, 1, -1 do
        local rand = math.random(size)
        items[i], items[rand] = items[rand], items[i]
    end
    return items
end

cooldown = {} -- Só usado se Config.SyncLoot for false

CreateThread(function()
    while true do
        for k, v in pairs(cooldown) do
            if v > 0 then
                cooldown[k] = v - 1
            else
                cooldown[k] = nil
            end
        end
        Wait(1000)
    end
end)

RegisterNetEvent("pz_loot:CL:recycle", function()
    local trash = exports.ox_inventory:Search('count', 'garbage')
    local trashCount = 0
    if trash > 100 then
        trashCount = 100
    else
        trashCount = trash
    end
    local droppedItens = {}
    local possibleDrops = doShuffle(Config.lootType.trashReturn.items)
    if trashCount > 1 then 
        QBCore.Functions.Notify("Aparentemente eu não tenho nada que possa ser usado aqui!", "error")
    end
    for i = 1, trashCount do
        droppedItens[i] = possibleDrops[math.random(1, #possibleDrops)]
    end
    if lib.progressBar({
        duration = trashCount * 1000,
        position = 'bottom',
        label = 'Reciclando '..trashCount..'x pedaços de lixo...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer', flag = 49
        }
    }) then
        for _, item in pairs(droppedItens) do
            TriggerServerEvent("pz_loot:giveitem", item, 1, nil)
        end
        TriggerServerEvent("pz_loot:removeitem", 'garbage', trashCount)
        exports["cw-rep"]:updateSkill("searching", Config.lootType.trashReturn.options.xp * trashCount)
    end
end)
local function removeByValue(tbl, value)
    for i = #tbl, 1, -1 do  -- Percorre a lista de trás para frente
        if tbl[i] == value then
            table.remove(tbl, i)
            break  -- Remove apenas a primeira ocorrência, remova isso se quiser remover todas
        end
    end
    return tbl
end
RegisterNetEvent("pz_loot:CL:openRecicleBox", function()
    local recicleBox = exports.ox_inventory:Search('count', 'recyclablematerial')
    local recicleBoxCount = 0
    if recicleBox > 100 then
        recicleBoxCount = 100
    else
        recicleBoxCount = recicleBox
    end
    local droppedItens = {}
    local possibleItems = removeByValue(Config.lootType.trashReturn.items, 'recyclablematerial')
    local possibleDrops = doShuffle(possibleItems)
    for i = 1, recicleBoxCount do
        droppedItens[i] = possibleDrops[math.random(1, #possibleDrops)]
    end
    if lib.progressBar({
        duration = recicleBoxCount * 1000,
        position = 'bottom',
        label = 'Abrindo '..recicleBoxCount..'x caixas recicláveis...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer', flag = 49
        }
    }) then
        for _, item in pairs(droppedItens) do
            TriggerServerEvent("pz_loot:giveitem", item, 1, nil)
        end
        TriggerServerEvent("pz_loot:removeitem", 'recyclablematerial', recicleBoxCount)
        exports["cw-rep"]:updateSkill("searching", Config.lootType.trashReturn.options.xp * recicleBoxCount)
    end
end)

RegisterNetEvent("pz_loot:CL:initial", function(prop, propData, type, time, anim, sound, progressLabel, allowTrash)
    local items = {}
    if not NetworkGetEntityIsNetworked(prop) then
        NetworkRegisterEntityAsNetworked(prop) -- Registra a entidade na rede
    end
    local netId = NetworkGetNetworkIdFromEntity(prop)
    local localCooldownId = type .. "_" .. netId .. "_" .. propData
    local soundId = GetSoundId()

    local function startLooting()
        -- Se não estiver usando o sync, verifica o cooldown local
        if not Config.SyncLoot and cooldown[localCooldownId] then
            QBCore.Functions.Notify("Eu acabei de procurar aqui, preciso tentar em outro local!", "error")
            return
        end

        local rarityCalc = math.random(1, #Config.Drop[type])
        local itemData = Config.Drop[type][rarityCalc].data.options
        local itemList = Config.Drop[type][rarityCalc].data.items

        itemList = doShuffle(itemList)
        local item = itemList[math.random(1, #itemList)]
        local amount = math.random(1, itemData.quantity)
        local chance = math.random(1, 100)
        local luck = math.random(1, itemData.probability)
        local searchingLevel = math.floor(exports["cw-rep"]:getCurrentLevel('searching') / 100)
        local willDrop = false
        local xpEarned = math.random(1, itemData.xp)

        local _time = GetClockHours()
        if _time >= 22 or _time <= 5 then
            chance = math.random(1, 70)
        end

        if (searchingLevel) then
            if searchingLevel + luck >= chance then
                willDrop = true
            end
        else
            if luck >= chance then
                willDrop = true
            end
        end

        if type == 'fuel' then
            items = exports.ox_inventory:Search('slots', 'jerrycan')
        end

        local searchTime = Config.searchTimeUnarmed
        local weaponHash = GetSelectedPedWeapon(PlayerPedId())
        if weaponHash ~= GetHashKey("WEAPON_UNARMED") then
            searchTime = Config.searchTimeArmed
        else
            searchTime = Config.searchTimeUnarmed
        end

        if sound.playSound then
            if sound.audiobank then RequestAmbientAudioBank(sound.audiobank, true) end
            PlaySoundFromEntity(soundId, sound.name, prop, sound.soundset, true, 0)
        end

        if anim.crouch then
            RequestAnimDict("amb@medic@standing@kneel@base")
            while not HasAnimDictLoaded("amb@medic@standing@kneel@base") do
                Wait(10)
            end
            TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
        end

        if itemData.probability == 100 then
            willDrop = true
        end
        debugLog('PZ:Loot:Client:Debug - Sorte (Precisa ser maior que a chance): ' .. luck)
        debugLog('PZ:Loot:Client:Debug - Chance (Precisa ser menor que a sorte): ' .. chance)
        debugLog('PZ:Loot:Client:Debug - Quantidade: ' .. amount)
        debugLog('PZ:Loot:Client:Debug - Drop?: ' .. tostring(willDrop))
        local xpName = 'searching'
        if type == 'hunting' then
            xpName = 'hunting'
        end

        if lib.progressBar({
            duration = searchTime,
            position = 'bottom',
            label = progressLabel,
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
                combat = true
            },
            anim = {
                scenario = anim.scenario,
                dict = anim.animDict,
                clip = anim.name, 
                flag = 49,
            },
            prop = {
                model = anim.prop,
                bone = anim.bone or 28422,
                pos = anim.coords or vec3(0.0, 0.0, 0.0),
                rot = anim.rotation or vec3(0.0, 0.0, 0.0),
            }
        }) then
            if willDrop then
                debugLog('Item encontrado: ' .. json.encode(item))
                TriggerServerEvent("pz_loot:giveitem", item, amount, items)
                exports["cw-rep"]:updateSkill(xpName, xpEarned)
            else
                local lastChance = math.random(1, 5)
                if lastChance >= 2 and allowTrash then
                    local fallbackItem, fallbackQuantity = getFallbackLoot()
                    TriggerServerEvent("pz_loot:giveitem", fallbackItem, fallbackQuantity, nil)
                    QBCore.Functions.Notify('Só tem lixo aqui...', "alert")
                    exports["cw-rep"]:updateSkill("searching", 2)
                else
                    QBCore.Functions.Notify(Config.MissDropMessages[math.random(#Config.MissDropMessages)], "error")
                end
            end

            -- Se não estiver usando sync, marca o cooldown local; se estiver, a entidade já estará reservada até expirar
            if not Config.SyncLoot then
                cooldown[localCooldownId] = time
            end

            ClearPedTasks(PlayerPedId())
            if sound.playSound then
                StopSound(soundId)
                ReleaseSoundId(soundId)
            end
        else
            ClearPedTasks(PlayerPedId())
            RemoveAnimDict('amb@medic@standing@kneel@base')
            if sound.playSound then
                StopSound(soundId)
                ReleaseSoundId(soundId)
            end

            -- Libera a entidade no servidor para que outro jogador possa tentar
            if Config.SyncLoot then
                TriggerServerEvent("pz_loot:releaseEntity", localCooldownId)
            end
        end
    end

    -- Se a sincronização estiver ativada, consulta o servidor; senão, usa apenas o cooldown local
    if Config.SyncLoot then
        QBCore.Functions.TriggerCallback("pz_loot:canLoot", function(canLoot)
            if canLoot then
                startLooting()
            else
                QBCore.Functions.Notify("Aparentemente já passaram a mão em tudo por aqui!", "error")
            end
        end, localCooldownId, type, time)
    else
        startLooting()
    end
end)

RegisterNetEvent("pz_loot:CL:multi", function(prop, propData, type, time, anim, sound, progressLabel, allowTrash)
    if not NetworkGetEntityIsNetworked(prop) then
        NetworkRegisterEntityAsNetworked(prop) -- Registra a entidade na rede
    end
    local netId = NetworkGetNetworkIdFromEntity(prop)
    local localCooldownId = type .. "_" .. netId .. "_" .. propData
    local soundId = GetSoundId()

    local function startLooting()
        -- Se não estiver usando o sync, verifica o cooldown local
        if not Config.SyncLoot and cooldown[localCooldownId] then
            QBCore.Functions.Notify("Eu acabei de procurar aqui, preciso tentar em outro local!", "error")
            return
        end

        local rarityCalc = math.random(1, #Config.Drop[type])
        local itemData = Config.Drop[type][rarityCalc].data.options
        local itemList = Config.Drop[type][rarityCalc].data.items

        itemList = doShuffle(itemList)
        local dropItems = {}
        local dropAmount = math.random(1, itemData.quantity)

        for i=1, dropAmount do
            local item = itemList[math.random(1, #itemList)]
            local amount = math.random(1, itemData.quantity)
            table.insert(dropItems, {item, amount})
        end

        if dropAmount < 3 and allowTrash then
            local fallbackItem, fallbackQuantity = getFallbackLoot()
            table.insert(dropItems, {fallbackItem, fallbackQuantity})
        end

        local chance = math.random(1, 100)
        local luck = math.random(1, itemData.probability)
        local searchingLevel = math.floor(exports["cw-rep"]:getCurrentLevel('searching') / 100)
        local willDrop = false
        local xpEarned = math.random(1, itemData.xp)

        local _time = GetClockHours()
        if _time >= 22 or _time <= 5 then
            chance = math.random(1, 70)
        end

        if (searchingLevel) then
            if searchingLevel + luck >= chance then
                willDrop = true
            end
        else
            if luck >= chance then
                willDrop = true
            end
        end

        local searchTime = Config.searchTimeUnarmed
        local weaponHash = GetSelectedPedWeapon(PlayerPedId())
        if weaponHash ~= GetHashKey("WEAPON_UNARMED") then
            searchTime = Config.searchTimeArmed
        else
            searchTime = Config.searchTimeUnarmed
        end

        if sound.playSound then
            if sound.audiobank then RequestAmbientAudioBank(sound.audiobank, false) end
            PlaySoundFromEntity(soundId, sound.name, prop, sound.soundset, false, 0)
        end

        if anim.crouch then
            RequestAnimDict("amb@medic@standing@kneel@base")
            while not HasAnimDictLoaded("amb@medic@standing@kneel@base") do
                Wait(10)
            end
            TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
        end

        if itemData.probability == 100 then
            willDrop = true
        end
        local xpName = 'searching'
        if type == 'hunting' then
            xpName = 'hunting'
        end

        if lib.progressBar({
            duration = searchTime,
            position = 'bottom',
            label = progressLabel,
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
                combat = true
            },
            anim = {
                scenario = anim.scenario,
                dict = anim.animDict,
                clip = anim.name, 
                flag = 49
            },
            prop = {
                model = anim.prop,
                bone = anim.bone or 28422,
                pos = anim.coords or vec3(0.0, 0.0, 0.0),
                rot = anim.rotation or vec3(0.0, 0.0, 0.0),
            }
        }) then
            if willDrop then
                debugLog('Itens encontrados: ' .. json.encode(dropItems))
                local drop = lib.callback.await('pz_loot:createDrop', false, dropItems)
                exports["cw-rep"]:updateSkill(xpName, xpEarned)
                exports.ox_inventory:openInventory('drop', drop)
            else
                local lastChance = math.random(1, 5)
                if lastChance >= 2 then
                    local fallbackItems = getMultiFallbackLoot()
                    local drop = lib.callback.await('pz_loot:createDrop', false, fallbackItems)
                    exports["cw-rep"]:updateSkill("searching", 2)
                    exports.ox_inventory:openInventory('drop', drop)
                else
                    QBCore.Functions.Notify(Config.MissDropMessages[math.random(#Config.MissDropMessages)], "error")
                end
            end

            -- Se não estiver usando sync, marca o cooldown local; se estiver, a entidade já estará reservada até expirar
            if not Config.SyncLoot then
                cooldown[localCooldownId] = time
            end

            ClearPedTasks(PlayerPedId())
            if sound.playSound then
                StopSound(soundId)
                ReleaseSoundId(soundId)
            end
        else
            ClearPedTasks(PlayerPedId())
            RemoveAnimDict('amb@medic@standing@kneel@base')
            if sound.playSound then
                StopSound(soundId)
                ReleaseSoundId(soundId)
            end

            -- Libera a entidade no servidor para que outro jogador possa tentar
            if Config.SyncLoot then
                TriggerServerEvent("pz_loot:releaseEntity", localCooldownId)
            end
        end
    end

    -- Se a sincronização estiver ativada, consulta o servidor; senão, usa apenas o cooldown local
    if Config.SyncLoot then
        QBCore.Functions.TriggerCallback("pz_loot:canLoot", function(canLoot)
            if canLoot then
                startLooting()
            else
                QBCore.Functions.Notify("Acho já passaram a mão em tudo por aqui!", "error")
            end
        end, localCooldownId, type, time)
    else
        startLooting()
    end
end)

function getFallbackLoot()
    local itemList = doShuffle(Config.lootType.fallbackLoot.items)
    local item = itemList[math.random(1, #itemList)]
    local quantity = math.random(1, Config.lootType.fallbackLoot.options.quantity)
    return item, quantity
end
function getMultiFallbackLoot()
    local itemList = doShuffle(Config.lootType.fallbackLoot.items)
    local dropItems = {}
    local dropAmount = math.random(1, 3)
    for i=1, dropAmount do
        local item = itemList[math.random(1, #itemList)]
        local amount = math.random(1, Config.lootType.fallbackLoot.options.quantity)
        table.insert(dropItems, {item, amount})
    end
    return dropItems
end
