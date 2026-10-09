CreateThread(function()
    local models = {
        "prop_tree_jacada_01", "prop_tree_jacada_02"
    }

    exports["qb-target"]:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = {                               -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
            {
                type = "client",
                action = function(entity)
                    WoodSakura(entity)
                end,
                icon = 'fa-solid fa-tree',
                label = 'Cortar madeira de Sakura',
                item = "WEAPON_HATCHET",
                canInteract = function(entity, distance, data) -- Isso verificará se você pode interagir com ele, isso não aparecerá se retornar falso, isso é OPCIONAL
                    local hatchets = exports.ox_inventory:Search('slots', 'WEAPON_HATCHET')
                    local count = 0
                    for _, v in pairs(hatchets) do
                        if v.metadata.durability > 0 then
                            count = count + v.count
                        end
                    end
                    if count < 1 then return false end

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

function WoodSakura(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = "wood_sakura"

    local progressLabel = 'Cortando madeira...'

    local anim = {
        animDict = "melee@hatchet@streamed_core",
        name = "plyr_front_takedown",
        crouch = false,
        prop = "w_me_hatchet",
        coords = vec3(0.07, 0.03, -0.01),
        rotation = vec3(-64.08, 0.0, 0.0),
        bone = 28422
    }

    local time = 30

    local sound = {
        name = "wood_cut",
        playSound = true,
        soundset = "dlc_heist_fleeca_sounds",
        audiobank = nil,
    }

    TriggerEvent("pz_loot:CL:initial", prop, propData, type, time, anim, sound, progressLabel, false)
end
