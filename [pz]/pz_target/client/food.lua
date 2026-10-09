CreateThread(function()
    local models = {
        "prop_rub_boxpile_04", "prop_rub_boxpile_04b", "prop_cratepile_03a", "prop_skid_box_05",
        "v_ret_247shelves05", "v_ret_247shelves01", "v_ret_247shelves03", "prop_fridge_01",
        "apa_mp_h_acc_fruitbowl_02", "prop_fruitstand_b", "prop_fruit_stand_01", "v_ret_247_choptom"
    }
    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = {                               -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
            {
                type = "client",
                action = function(entity)
                    Food(entity)
                end,
                icon = 'fa-solid fa-burger',
                label = 'Procurar comida',
                canInteract = function(entity, distance, data) -- Isso verificará se você pode interagir com ele, isso não aparecerá se retornar falso, isso é OPCIONAL
                    if not IsPedDeadOrDying(PlayerPedId(), false) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                        return true
                    else
                        return false
                    end
                end
            },
        },
        distance = 2.5 -- Esta é a distância que você deve estar para o alvo ficar azul, isso está em unidades GTA e tem que ser um valor flutuante
    })
end)

function Food(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'food'

    local progressLabel = 'Procurando comida...'

    local anim = {
        animDict = "anim@gangops@facility@servers@bodysearch@",
        name = "player_search",
        crouch = true
    }

    local time = 900

    local sound = {
        name = "searching",
        playSound = true,
        soundset = "misc_soundset",
        audiobank = "audiodirectory/misc_sounds",
    }

    TriggerEvent("pz_loot:CL:multi", prop, propData, type, time, anim, sound, progressLabel, false)
end
