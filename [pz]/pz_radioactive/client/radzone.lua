local QBCore = exports['qb-core']:GetCoreObject()

local zones = {{
    ['x'] = -2198.57,
    ['y'] = 2994.01,
    ['z'] = 32.81
}}

local notifIn = false
local notifOut = false
local closestZone = 1

Citizen.CreateThread(function()
    for k, zone in pairs(radzone.CircleZones) do
        CreateBlipCircle_rad(zone.coords, zone.name, zone.radius, zone.color, zone.sprite)
    end
end)

function CreateBlipCircle_rad(coords, text, radius, color, sprite)
    local blip = AddBlipForRadius(coords, radius)

    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, 76)
    SetBlipAlpha(blip, 150)

    blip = AddBlipForCoord(coords)

    SetBlipHighDetail(blip, true)
    SetBlipSprite(blip, sprite)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
        Citizen.Wait(0)
    end

    while true do
        local playerPed = GetPlayerPed(-1)
        local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
        local minDistance = 100000
        for i = 1, #zones, 1 do
            dist = Vdist(zones[i].x, zones[i].y, zones[i].z, x, y, z)
            if dist < minDistance then
                minDistance = dist
                closestZone = i
            end
        end
        Citizen.Wait(15000)
    end
end)

Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
        Citizen.Wait(0)
    end
    local isAdmin = lib.callback.await('pz_radioactive:SV:isAdmin')
    if not isAdmin then
        while true do
            Citizen.Wait(100)
            local player = GetPlayerPed(-1)
            local x, y, z = table.unpack(GetEntityCoords(player, true))
            local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)
            
            if dist <= 1000.0 then
                if not notifIn then
                    if not notifIn then
                        QBCore.Functions.Notify('Você entrou em uma zona radioativa', "primary", 2000)
    
                        notifIn = true
                        notifOut = false
                        local playermask = GetPedDrawableVariation(player, 1, 46) -- 46 is number of mask				
                        local playertorso = GetPedDrawableVariation(player, 11, 67) -- 67 is number of torso					
                        local playerpants = GetPedDrawableVariation(player, 4, 40) -- 40 is number of pants	
    
                        local gender = GetEntityModel(player) == GetHashKey("mp_m_freemode_01") and "male" or "female"
                        if (gender == "male" and playermask == 46 and playertorso == 67 and playerpants == 40) or (gender == "female" and playermask == 46 and playertorso == 61 and playerpants == 40) then -- 
                            QBCore.Functions.Notify('Você possui EPI', "primary", 2000)
                        else
                            QBCore.Functions.Notify('Você não possui EPI', "primary", 2000)
    
                            RequestAnimSet("move_m@drunk@verydrunk")
                            HasAnimSetLoaded("move_m@drunk@verydrunk")
                            SetPedMovementClipset(player, "move_m@drunk@moderatedrunk", true)
                            SetPedMotionBlur(player, true)
                            SetPedIsDrunk(player, true)
                            Citizen.CreateThread(function()
                                while true do
                                    Citizen.Wait(1000)
                                    local playerPed = (GetPlayerPed(-1))
                                    local maxHealth = GetEntityMaxHealth(playerPed)
                                    local health = GetEntityHealth(playerPed)
                                    local newHealth = math.min(maxHealth, math.floor(health - maxHealth / 40))
                                    SetEntityHealth(playerPed, newHealth)
                                    if notifOut then
                                        break
                                    end
                                end
                            end)
                        end
                    end
                end
            else
                if not notifOut then
                    QBCore.Functions.Notify('você saiu de uma zona radioativa', "primary", 2000)
    
                    notifOut = true
                    notifIn = false
                end
            end
            if notifIn then
                StartScreenEffect("DrugsTrevorClownsFight", 0, false)
            end
        end
    end
end)

RegisterNetEvent("rad:clear")
AddEventHandler("rad:clear", function()
    local player = GetPlayerPed(-1)

    QBCore.Functions.Progressbar("takepillls", "Tomando pílulas...", 10000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        canCancel = false
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function()

        StopScreenEffect('DrugsMichaelAliensFight')
        StopScreenEffect('DrugsTrevorClownsFight')
        ClearTimecycleModifier()
        ClearTimecycleModifier()
        ResetScenarioTypesEnabled()
        ResetPedMovementClipset(player, 0)
        SetPedIsDrunk(player, false)
        SetPedMotionBlur(player, false)
        ExecuteCommand("e c")

    end)
end)

RegisterNetEvent("indossa:hazmatwoman")
AddEventHandler("indossa:hazmatwoman", function()
    local player = PlayerPedId()

    SetPedComponentVariation(player, 11, 61, 3) -- torso
    SetPedComponentVariation(player, 3, 101) -- arms
    SetPedComponentVariation(player, 8, 43, 3) -- t-shirt
    SetPedComponentVariation(player, 1, 46) -- mask
    SetPedComponentVariation(player, 4, 40, 3) -- pants
    SetPedComponentVariation(player, 6, 25) -- shoes
end)

RegisterNetEvent("indossa:hazmatman")
AddEventHandler("indossa:hazmatman", function()
    local player = PlayerPedId()

    SetPedComponentVariation(player, 11, 67, 3) -- torso
    SetPedComponentVariation(player, 3, 93) -- arms
    SetPedComponentVariation(player, 8, 62, 3) -- t-shirt
    SetPedComponentVariation(player, 1, 46) -- mask
    SetPedComponentVariation(player, 4, 40, 3) -- pants
    SetPedComponentVariation(player, 6, 25) -- shose
end)

RegisterNetEvent("indossa:hazmat")
AddEventHandler("indossa:hazmat", function()
    local player = PlayerPedId()
    local gender = GetEntityModel(player) == GetHashKey("mp_m_freemode_01") and "male" or "female"


    QBCore.Functions.Progressbar("hazmat", "Vestindo o Traje Hazmat", 10000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        canCancel = false
    }, {
        animDict = "clothingshirt",
        anim = "try_shirt_positive_d",
        flags = 1,
    }, {}, {}, function()

        if gender == "female" then
            SetPedComponentVariation(player, 11, 61, 3) -- torso
            SetPedComponentVariation(player, 3, 101) -- arms
            SetPedComponentVariation(player, 8, 43, 3) -- t-shirt
            SetPedComponentVariation(player, 1, 46) -- mask
            SetPedComponentVariation(player, 4, 40, 3) -- pants
            SetPedComponentVariation(player, 6, 25) -- shoes
        else
            SetPedComponentVariation(player, 11, 67, 3) -- torso
            SetPedComponentVariation(player, 3, 93) -- arms
            SetPedComponentVariation(player, 8, 62, 3) -- t-shirt
            SetPedComponentVariation(player, 1, 46) -- mask
            SetPedComponentVariation(player, 4, 40, 3) -- pants
            SetPedComponentVariation(player, 6, 25) -- shoes
        end

        ClearPedTasks(PlayerPedId())

    end)
end)

