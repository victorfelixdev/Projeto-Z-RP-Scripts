CreateThread(function()
    local models = {
        "prop_rub_carwreck_2", "prop_rub_carwreck_3", "prop_rub_carwreck_5", "prop_rub_carwreck_7",
        "prop_rub_carwreck_8", "prop_rub_carwreck_9", "prop_rub_carwreck_10", "prop_rub_carwreck_11",
        'prop_rub_carwreck_12', "prop_rub_carwreck_14", "prop_rub_carwreck_15", "prop_rub_carwreck_16",
        "prop_rub_buswreck_06", "xs_prop_arena_car_wall_02a", "prop_rub_carwreck_13","prop_rub_carwreck_17"
    }

    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = { -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
        {
            type = "client",
            action = function(entity)
                Car(entity)
            end,
            icon = 'fa-solid fa-screwdriver-wrench',
            label = 'Procurar peças',
            canInteract = function(entity, distance, data) -- Isso verificará se você pode interagir com ele, isso não aparecerá se retornar falso, isso é OPCIONAL
                if not IsPedDeadOrDying(PlayerPedId(), false) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                    return true
                else
                    return false
                end
            end
        },
    },
        distance = 2.5
    })
end)

function Car(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'car'

    local progressLabel = 'Procurando peças...'

    local anim = {
        animDict = "anim@gangops@facility@servers@bodysearch@",
        name = "player_search",
        crouch = true
    }
    
    local time = 3600

    local sound = {
        name = "searching",
        playSound = true,
        soundset = "misc_soundset",
        audiobank = "audiodirectory/misc_sounds",
    }

    TriggerEvent("pz_loot:CL:multi", prop, propData, type, time, anim, sound, progressLabel, true)
end