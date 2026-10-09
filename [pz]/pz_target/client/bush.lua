CreateThread(function()
    local models = {
        "prop_woodpile_01b", "prop_bush_lrg_01b", "prop_bush_lrg_01c", "prop_bush_lrg_01c_cr", "prop_bush_lrg_01d",
        "prop_bush_lrg_01e", "prop_bush_lrg_01e_cr", "prop_bush_lrg_01e_cr2", "prop_bush_lrg_02", "prop_bush_lrg_02b",
        "prop_bush_lrg_03", "prop_bush_lrg_04b", "prop_bush_lrg_04c", "prop_bush_lrg_04d", "prop_bush_med_01",
        "prop_bush_med_03"
    }

    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = { -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
        {
            type = "client",
            action = function(entity)
                Bush(entity)
            end,
            icon = 'fa-solid fa-box-open',
            label = 'Catar Madeira',
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

function Bush(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'bush'

    local progressLabel = 'Coletando galhos...'

    local anim = {
        animDict = "anim@gangops@facility@servers@bodysearch@",
        name = "player_search",
        crouch = true
    }

    local time = 30

    local sound = {
        name = "searching",
        playSound = true,
        soundset = "misc_soundset",
        audiobank = "audiodirectory/misc_sounds",
    }

    TriggerEvent("pz_loot:CL:initial", prop, propData, type, time, anim, sound, progressLabel, false)
end