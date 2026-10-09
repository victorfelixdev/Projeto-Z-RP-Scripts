CreateThread(function()
    local models = {"ex_prop_crate_closed_ms", "ex_prop_crate_highend_pharma_sc", "ba_prop_battle_crate_m_medical",
                    "ba_prop_battle_crate_med_bc", "xm_prop_smug_crate_s_medical", "ex_prop_crate_med_sc",
                    "ex_prop_crate_pharma_bc", "sm_prop_smug_crate_l_medical",
                    "sm_prop_smug_crate_s_medical", "v_med_trolley", "v_med_bench1 ", "v_med_cor_wallunita",
                    "v_med_cor_wallunitb", "v_med_lab_fridge", "v_med_cor_cembin", "v_med_bottles1", "v_med_bottles3",
                    "v_med_cor_fileboxa", "v_40_receptiondesk2", "v_med_trolley2", "v_med_latexgloveboxblue",
                    "v_med_lab_wallcab", "v_med_bench2", "xm_prop_x17_bag_med_01a", "prop_medstation_01"
                }
    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = { -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
        {
            type = "client",
            action = function(entity)
                Medicine(entity)
            end,
            icon = 'fa-solid fa-pen-ruler',
            label = 'Procurar Medicamentos',
            canInteract = function(entity, distance, data) -- Isso verificará se você pode interagir com ele, isso não aparecerá se retornar falso, isso é OPCIONAL
                local targetServerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))
                local data = lib.callback.await('ars_ambulancejob:getData', false, targetServerId)
                if data.status.isDead then
                    return false
                else
                    return true
                end
            end
        },
    },
    distance = 2.5 -- Esta é a distância que você deve estar para o alvo ficar azul, isso está em unidades GTA e tem que ser um valor flutuante
    })
end)

function Medicine(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'medic'

    local progressLabel = 'Procurando medicamentos...'

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

    TriggerEvent("pz_loot:CL:multi", prop, propData, type, time, anim, sound, progressLabel, false)
end
