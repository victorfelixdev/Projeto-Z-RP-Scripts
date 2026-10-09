CreateThread(function()
    local models = {
        "prop_drug_package", 243282660, "prop_mp_drug_pack_blue", "prop_drug_package_02", "prop_mp_drug_package", "prop_mp_drug_pack_red"
    }
    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = { -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
        {
            type = "client",
            action = function(entity)
                Drugs(entity)
            end,
            icon = 'fa-solid fa-pen-ruler',
            label = 'Procurar Drogas',
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

function Drugs(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'drugs'

    local progressLabel = 'Procurando drogas...'

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
