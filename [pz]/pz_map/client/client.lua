local QBCore = exports['qb-core']:GetCoreObject()
local currentMapMetadata = nil
local inMenuMode = false
local Animation = false
local inPauseMap = false

function AnimMode()
    if not inMenuMode then
        if not IsPedInAnyVehicle(PlayerPedId(), false) then
            Animation = true
            inMenuMode = true
            local Player = PlayerPedId()
            local AnimDict = "amb@world_human_tourist_map@male@idle_b"
            local Anim = "idle_d"
            LoadAnim(AnimDict)
            local Prop = 'p_tourist_map_01_s'
            local PropBone = 28422
            AddPropToPlayer(Prop, PropBone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            TaskPlayAnim(GetPlayerPed(-1), AnimDict, Anim, 2.0, 8.0, -1, 53, 0, false, false, false)
        end
    else

    end
end

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Wait(10)
    end
end

local PlayerProps = {}
function AddPropToPlayer(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
    local Player = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(Player))

    if not HasModelLoaded(prop1) then
        LoadPropDict(prop1)
    end

    local prop = CreateObject(GetHashKey(prop1), x, y, z + 0.2, true, true, true)
    AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true,
        false, true, 1, true)
    table.insert(PlayerProps, prop)
    SetModelAsNoLongerNeeded(prop1)
end

function DestroyAllProps()
    for _, v in pairs(PlayerProps) do
        DeleteEntity(v)
    end
end

-- Evento acionado ao usar o item "map"
RegisterNetEvent("pz_map:CL:openMap", function(metadata)
    inPauseMap = true
    currentMapMetadata = metadata

    if metadata and metadata.mapAnnotationID then
        TriggerServerEvent("pz_map:SV:loadDrawing", metadata.mapAnnotationID)
    end

    -- Define o foco na NUI e envia a mensagem para abrir a interface
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        mapImage = Config.MapImageURL,
        mapList = Config.Maps,
    })

end)

-- Recebe os dados de desenho salvos e envia para a NUI carregar
RegisterNetEvent("pz_map:CL:returnLoadDrawing", function(drawingData, mapType)
    SendNUIMessage({
        action = "loadDrawing",
        drawingData = drawingData,
        mapType = mapType,
        mapList = Config.Maps,
    })
end)

-- Callback da NUI para salvar os desenhos
RegisterNUICallback("saveDrawing", function(data, cb)
    if currentMapMetadata and currentMapMetadata.mapAnnotationID then
        TriggerServerEvent("pz_map:SV:saveDrawing", currentMapMetadata.mapAnnotationID, data.drawingData, data.mapType)
    end
    SetNuiFocus(false, false)
    cb("ok")
    inPauseMap = false
end)

-- Callback da NUI para replicar o mapa
RegisterNUICallback("replicateMap", function(data, cb)
    if currentMapMetadata and currentMapMetadata.mapAnnotationID then
        TriggerServerEvent("pz_map:SV:replicateMap", currentMapMetadata.mapAnnotationID)
    end
    cb("ok")
end)

-- Callback da NUI para fechar a interface sem salvar
RegisterNUICallback("closeMap", function(data, cb)
    SetNuiFocus(false, false)
    cb("ok")
    inPauseMap = false
end)

CreateThread(function() SetPauseMenuActive(false) end)

CreateThread(function()
    while true do
        Wait(100)
        if inPauseMap then
            AnimMode()
        else
            if Animation then
                Animation = false
                ClearPedTasks(PlayerPedId())
            end
            inMenuMode = false
            DestroyAllProps()
        end
    end

end)

