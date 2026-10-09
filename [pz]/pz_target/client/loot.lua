CreateThread(function()
    local models = {"hei_prop_drug_statue_box_big", "hei_prop_drug_statue_stack", "hei_prop_heist_box",
                    "prop_rub_cardpile_07", "prop_cratepile_02a", "prop_cratepile_05a", "prop_rub_cage01b",
                    "prop_rub_boxpile_01", "prop_rub_boxpile_10", "prop_rub_boxpile_02", "prop_crate_02a",
                    "prop_skid_trolley_2", "prop_homeles_shelter_02", "prop_cs_cardbox_01", "prop_champ_box_01",
                    "prop_tool_box_07", "prop_cs_rub_box_02", "prop_beer_box_01", "prop_box_wood05a", "v_ret_ta_box",
                    "v_ind_cf_chckbox2", "prop_cardbordbox_03a", "prop_box_wood02a", "prop_boxpile_03a",
                    "prop_boxpile_07d", "prop_cardbordbox_04a", "prop_boxpile_05a", "prop_box_wood02a_pu",
                    "prop_box_wood01a", "v_ret_gc_box1", "v_ind_cs_box01", "prop_box_wood07a", "prop_cardbordbox_02a",
                    "xs_prop_arena_bag_01", "prop_luggage_08a", "prop_cardbordbox_05a", "prop_luggage_01a",
                    "prop_luggage_02a", "prop_luggage_09a", "v_res_filebox01", "v_corp_tallcabdark01",
                    "v_corp_deskdrawdark01", "v_corp_deskdraw", "v_res_smallplasticbox", "v_corp_offshelf",
                    "v_ind_rc_workbag", "v_corp_lowcabdark01", "prop_box_wood04a", 1495931183, "prop_cabinet_02b", 'prop_boxpile_02d',
                    "prop_rub_boxpile_07", "prop_boxpile_02c", "prop_boxpile_02b", "prop_box_wood08a", "prop_box_wood07a", "prop_box_wood06a",
                    "prop_rub_boxpile_03", "prop_rub_trolley03a", "prop_rub_boxpile_09", "prop_rub_boxpile_08", "prop_rub_boxpile_07","prop_rub_boxpile_06",
                    "prop_rub_boxpile_05", "prop_boxpile_01a", "prop_flattruck_01c"
                }
    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = { -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
        {
            type = "client",
            -- event = 'pz_target:LootCL',
            action = function(entity)
                Loot(entity)
            end,
            icon = 'fa-solid fa-box-open',
            label = 'Vasculhar',
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
function Loot(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'loot'

    local progressLabel = 'Vasculhando...'

    local anim = {
        animDict = "anim@gangops@facility@servers@bodysearch@",
        name = "player_search",
        crouch = true
    }
    
    local time = 1800

    local sound = {
        name = "searching",
        playSound = true,
        soundset = "misc_soundset",
        audiobank = "audiodirectory/misc_sounds",
    }

    TriggerEvent("pz_loot:CL:multi", prop, propData, type, time, anim, sound, progressLabel, true)
end
