local previewPed = nil
local variation = 0
HandleItem = nil

local clothesV2Male = {
    ['cloth_mask'] = {
        max = 244,
        category = 1,
        blacklist = {},
        whitelist = {}
    },
    ['cloth_torso'] = {
        max = 574,
        category = 11,
        blacklist = {},
        whitelist = {}
    },
    ['cloth_shirt'] = {
        max = 214,
        category = 8,
        blacklist = {},
        whitelist = {}
    },
    ['cloth_gloves'] = {
        max = 213,
        category = 3,
        blacklist = {},
        whitelist = {}
    },
    ['cloth_pants'] = {
        max = 215,
        category = 4,
        blacklist = {},
        whitelist = {}
    },
    ['cloth_shoes'] = {
        max = 155,
        category = 6,
        blacklist = {},
        whitelist = {}
    },
    ['cloth_hat'] = {
        max = 237,
        category = 'prop_0',
        blacklist = {
            116, 117, 118, 119,147, 148
        },
        whitelist = {}
    },
    ['cloth_glass'] = {
        max = 58,
        category = 'prop_1',
        blacklist = {},
        whitelist = {}
    },
    ['nightvision'] = {
        max = 6,
        category = 'prop_0',
        blacklist = {},
        whitelist = {
            117, 119, 148
        }
    },
}
local clothesV2Female = {
    ['cloth_mask'] = {
        max = 245,
        category = 1,
        blacklist = {},
        whitelist = {}
    },
    ['cloth_torso'] = {
        max = 617,
        category = 11,
        blacklist = {},
        whitelist = {}
    },
    ['cloth_shirt'] = {
        max = 260,
        category = 8,
        blacklist = {},
        whitelist = {}
    },
    ['cloth_gloves'] = {
        max = 247,
        category = 3,
        blacklist = {},
        whitelist = {}
    },
    ['cloth_pants'] = {
        max = 228,
        category = 4,
        blacklist = {},
        whitelist = {}
    },
    ['cloth_shoes'] = {
        max = 163,
        category = 6,
        blacklist = {},
        whitelist = {}
    },
    ['cloth_hat'] = {
        max = 236,
        category = 'prop_0',
        blacklist = {
            116, 117, 118, 119, 147, 148
        },
        whitelist = {}
    },
    ['cloth_glass'] = {
        max = 60,
        category = 'prop_1',
        blacklist = {},
        whitelist = {}
    },
    ['nightvision'] = {
        max = 6,
        category = 'prop_0',
        blacklist = {},
        whitelist = {
            117, 119, 148
        }
    },
}

function SendNuiMessage(functionName, functionParameters, functionExtras)
    SendNUIMessage({
        type = functionName,
        content = functionParameters,
        extras = functionExtras
    })
end

function closeNUI()
    SendNuiMessage("showMenu", false)
    SetNuiFocus(false, false)
    destroyPedScreen()
end

function saveSkin(metadata, newItem)
    
    local playerPed = cache.ped or PlayerPedId()
    local appearance = exports['illenium-appearance']:getPedAppearance(playerPed)
    if appearance then
        TriggerServerEvent('illenium-appearance:server:saveAppearance', appearance)
        if newItem then TriggerServerEvent('pz_clothing:SV:saveItemMetadata', HandleItem, metadata) end
        return true
    end

    return false
end

function SaveClothing(data, newItem)
    local playerPed = cache.ped or PlayerPedId()
    local metadata = nil
    lib.progressBar({
        duration = 5000,
        position = 'bottom',
        label = 'Vestindo a roupa...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true
        },
        anim = {
            dict = 'clothingshirt',
            clip = 'try_shirt_positive_d', 
            flag = 49
        },
    })
    if data.category == 'prop_0' then
        SetPedPropIndex(playerPed, 0, tonumber(data.id), tonumber(data.variation), 1)
        
    elseif data.category == 'prop_1' then
        SetPedPropIndex(playerPed, 1, tonumber(data.id), tonumber(data.variation), 1)
        
    else
        SetPedComponentVariation(playerPed, tonumber(data.category), tonumber(data.id), tonumber(data.variation), 2)
    end

    metadata = {
        variation = tonumber(data.variation),
        category = data.category,
        sex = data.sex,
        id = tonumber(data.id)
    }

    saveSkin(metadata, newItem)
    Wait(100)

    closeNUI()
end

RegisterNUICallback("close", function()
    closeNUI()
end)

RegisterNUICallback("previewClothing", function(data)
    if data.category == 'prop_0' then
        SetPedPropIndex(previewPed, 0, tonumber(data.id), tonumber(data.variation), 1)
    elseif data.category == 'prop_1' then
        SetPedPropIndex(previewPed, 1, tonumber(data.id), tonumber(data.variation), 1)
    else
        SetPedComponentVariation(previewPed, tonumber(data.category), tonumber(data.id), tonumber(data.variation), 2)
    end
    Wait(100)
end)

RegisterNUICallback("saveClothing", function(data)
    SaveClothing(data, true)
end)

RegisterNetEvent('pz_clothing:CL:openClothingMenu', function(item)
    local part = item.name
    local data = {}
    HandleItem = item
    if item.metadata.variation then
        SaveClothing(item.metadata, false)
    else
        createPedScreen() 
        if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then
            data.sex = 'male'
            data.category = clothesV2Male[part].category
            data.max = clothesV2Male[part].max
            data.blacklist = clothesV2Male[part].blacklist
            data.whitelist = clothesV2Male[part].whitelist
        else
            data.sex = 'female'
            data.category = clothesV2Female[part].category
            data.max = clothesV2Female[part].max
            data.blacklist = clothesV2Female[part].blacklist
            data.whitelist = clothesV2Female[part].whitelist
        end
        data.item = item
        data.variation = 0
        SetNuiFocus(true, true)
        SendNuiMessage('showMenu', true, data)
    end
end)

RegisterNetEvent('pz_clothing:CL:useClothing', function(item)
    local part = item.name
    local data = {}
    HandleItem = item

    if item.metadata.outfit then
        print(true)
        for _, item in pairs(item.metadata.outfit) do
            SaveClothing(item, false)
            Wait(100)
        end
    end
end)

function createPedScreen() 

    CreateThread(function()

        heading = GetEntityHeading(PlayerPedId())
        SetFrontendActive(true)
        ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), true, -1)
        Wait(100)
        N_0x98215325a695e78a(false)
        PlayerPedPreview = ClonePed(PlayerPedId(), heading, true, false)
        local x,y,z = table.unpack(GetEntityCoords(PlayerPedPreview))
        SetEntityCoords(PlayerPedPreview, x,y,z-10)
        FreezeEntityPosition(PlayerPedPreview, true)
        SetEntityVisible(PlayerPedPreview, false, false)
        NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, false)
        Wait(200)
        SetPedAsNoLongerNeeded(PlayerPedPreview)
        GivePedToPauseMenu(PlayerPedPreview, 2)
        SetPauseMenuPedLighting(true)
        SetPauseMenuPedSleepState(true)
        ReplaceHudColourWithRgba(117, 0, 0, 0, 0)
        previewPed = PlayerPedPreview
    end)
end

function destroyPedScreen()
    DeleteEntity(previewPed)
    DeletePed(previewPed)
    SetPauseMenuPedLighting(false)
    SetPauseMenuPedSleepState(false)
    SetFrontendActive(false)
    ReplaceHudColourWithRgba(117, 0, 0, 0, 186)
end