CreateThread(function()
    local models = {"prop_bin_01a", "prop_bin_03a", "prop_bin_05a", "prop_dumpster_01a", "prop_dumpster_02a",
                    "prop_dumpster_02b", "prop_dumpster_4a", "prop_dumpster_4b", "prop_rub_binbag_03b",
                    "prop_rub_binbag_01b", "prop_bin_06a", "prop_rub_binbag_05", "prop_bin_02a", "prop_rub_binbag_04",
                    "prop_rub_binbag_06", "prop_skip_04", "prop_cs_bin_02", "prop_skip_03", "prop_bin_08a",
                    "v_serv_waste_bin1", "prop_gas_smallbin01", "v_ret_gc_bin", "prop_recyclebin_02_d",
                    "prop_recyclebin_02b", "prop_recyclebin_02a", "prop_bin_07c", "prop_bin_07b", "prop_bin_07a"}

    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = { -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
        {
            type = "client",
            action = function(entity)
                Trash(entity)
            end,
            icon = 'fa-solid fa-trash',
            label = 'Catar lixo',
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

function Trash(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'trash'

    local progressLabel = 'Catando lixo...'

    local anim = {
        animDict = "anim@gangops@facility@servers@bodysearch@",
        name = "player_search",
        crouch = true
    }

    local time = 300

    local sound = {
        name = "searching",
        playSound = true,
        soundset = "misc_soundset",
        audiobank = "audiodirectory/misc_sounds",
    }

    TriggerEvent("pz_loot:CL:multi", prop, propData, type, time, anim, sound, progressLabel, true)
end