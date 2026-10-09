CreateThread(function()
    local models = {
        "prop_vend_soda_01", "prop_vend_soda_02", "prop_crate_11a", "prop_crate_11b", "prop_crate_11c",
        "prop_crate_11d", "prop_crate_11e", "v_ret_ml_fridge", "v_ret_fh_coolbox",
        "ba_prop_battle_crate_beer_01", "ba_prop_battle_crate_beer_02", "ba_prop_battle_crate_beer_03",
        "ba_prop_battle_crate_beer_04", "ba_prop_battle_crate_beer_double", "v_ret_247shelves02", "v_ret_247shelves04"
    }

    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = {                               -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
            {
                type = "client",
                action = function(entity)
                    Drink(entity)
                end,
                icon = 'fa-solid fa-beer-mug-empty',
                label = 'Procurar bebida',
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

function Drink(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'drink'

    local progressLabel = 'Procurando bebidas...'

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
