local QBCore = exports['qb-core']:GetCoreObject()

local function debugLog(msg)
    if Config.Debug then
        print("[DEBUG] " .. msg)
    end
end
-- Registra o uso do item "map" via ox_inventory
QBCore.Functions.CreateUseableItem("map", function(source, item)
    -- Envia os metadados do item para o client (deve conter o mapAnnotationID)
    TriggerClientEvent("pz_map:CL:openMap", source, item.metadata)
end)

-- Salva os dados de desenho no banco de dados
RegisterNetEvent("pz_map:SV:saveDrawing", function(mapAnnotationID, drawingData, mapType)
    local src = source
    exports.oxmysql:execute(
        "INSERT INTO player_map_annotations (mapAnnotationID, data, mapType) VALUES (?,?,?) ON DUPLICATE KEY UPDATE mapAnnotationID = ?, data = ?, mapType = ?",
        { mapAnnotationID, drawingData, mapType, mapAnnotationID, drawingData, mapType },
        function(rowsChanged)
            lib.notify(src, {
                description = 'Desenho salvo',
                type = 'success'
            })
        end
    )
end)

-- Busca os dados de desenho no banco de dados
RegisterNetEvent("pz_map:SV:loadDrawing", function(mapAnnotationID)
    local src = source
    exports.oxmysql:execute("SELECT * FROM player_map_annotations WHERE mapAnnotationID = ?", { mapAnnotationID }, function(result)
        local data = nil
        local mapType = nil
        if result[1] then
            data = result[1].data
            mapType = result[1].mapType
        end
        TriggerClientEvent("pz_map:CL:returnLoadDrawing", src, data, mapType)
    end)
end)

-- Função para replicar o mapa usando ox_inventory
RegisterNetEvent("pz_map:SV:replicateMap", function(slot)
    local src = source
    local slotData = exports.ox_inventory:GetSlot(src, slot)
    local mapAnnotationID = slotData.metadata.mapAnnotationID
    
    local printerCount = exports.ox_inventory:Search(src, 'count', 'printer_paper')
    if printerCount and printerCount > 0 then
        exports.ox_inventory:RemoveItem(src, 'printer_paper', 1)
        local _, response = exports.ox_inventory:AddItem(src, 'map', 1)
        local result = MySQL.query.await('SELECT * FROM player_map_annotations WHERE mapAnnotationID = ?', {mapAnnotationID})

        TriggerEvent('pz_map:SV:saveDrawing', response[1].metadata.mapAnnotationID, result[1].data, result[1].mapType)
    else
        lib.notify(source, {
            description = 'Eu preciso de um papel em branco pra isso.',
            type = 'error'
        })
    end
end)
-- Função para replicar o mapa usando ox_inventory
RegisterNetEvent("pz_map:SV:createMap", function(slot)
    exports.ox_inventory:RemoveItem(source, 'printer_paper', 1)
    exports.ox_inventory:AddItem(source, 'map', 1)
end)

local function generateMapId()
    local characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local gen = ""

    for i = 1, Config.MapCodeSize do
        local randomChar = math.random(1, #characters)
        gen = gen..string.sub(characters, randomChar, randomChar)
    end
    local result = MySQL.query.await('SELECT mapAnnotationID FROM player_map_annotations WHERE mapAnnotationID = ?', {gen})
    return (result[1] and generateMapId()) or gen
end

local MAP_HOOK = exports.ox_inventory:registerHook('createItem', function(payload)
    local metadata = payload.metadata
    if metadata.unique then return metadata end

    metadata.mapAnnotationID = generateMapId()
    metadata.description = 'ID do Mapa: '..metadata.mapAnnotationID
    metadata.unique = true
    MySQL.insert.await('INSERT INTO player_map_annotations (mapAnnotationID, data, mapType) VALUES (?, ?, ?)', {metadata.mapAnnotationID, json.encode({}), Config.Maps[1].name})

    return metadata
end, {
    print = false,
    itemFilter = {
        map = true
    }
})