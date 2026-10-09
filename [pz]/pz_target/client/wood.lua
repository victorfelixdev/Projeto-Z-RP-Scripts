CreateThread(function()
    local models = {
        "prop_joshua_tree_02c", "prop_joshua_tree_01b", "prop_joshua_tree_02d", "prop_joshua_tree_01a",
        "prop_joshua_tree_01e", "prop_joshua_tree_01d", "prop_joshua_tree_01c", "prop_joshua_tree_02b",
        "prop_joshua_tree_02a", "prop_joshua_tree_02e", "prop_tree_olive_creator", "prop_tree_birch_03b",
        "prop_tree_birch_03", "prop_tree_birch_01", "prop_tree_birch_02", "prop_tree_birch_04",
        "prop_tree_birch_05", "prop_tree_cedar_02", "prop_tree_cedar_03", "prop_tree_cedar_04",
        "prop_tree_cedar_s_01", "prop_tree_cedar_s_02", "prop_tree_cedar_s_04", "prop_tree_cedar_s_05",
        "prop_tree_cedar_s_06", "prop_tree_cypress_01", "prop_tree_eng_oak_01", "prop_tree_eng_oak_creator",
        "prop_tree_eucalip_01", "prop_tree_fallen_01", "prop_tree_fallen_02", "prop_tree_fallen_pine_01",
        "prop_tree_lficus_02", "prop_tree_lficus_03",
        "prop_tree_lficus_05", "prop_tree_lficus_06", "prop_tree_log_01", "prop_tree_log_02",
        "prop_tree_maple_02", "prop_tree_maple_03", "prop_tree_mquite_01", "prop_tree_mquite_01_l2",
        "prop_tree_oak_01", "prop_tree_olive_cr2", "prop_tree_pine_01", "prop_w_r_cedar_01",
        "prop_tree_pine_02", "test_tree_cedar_trunk_001", "test_tree_forest_trunk_01", "test_tree_forest_trunk_04",
        "prop_snow_tree_04_d", "prop_snow_tree_04_f", "prop_tree_olive_01", "prop_tree_eng_oak_cr2",
        "prop_palm_fan_03_c", "prop_palm_fan_03_d", "prop_palm_fan_04_b", "prop_palm_fan_04_d", "prop_palm_fan_04_c",
        "prop_palm_fan_03_b", "prop_palm_fan_02_a","prop_palm_fan_03_a", "prop_bush_lrg_02"
    }

    exports["qb-target"]:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = {                               -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
            {
                type = "client",
                action = function(entity)
                    Wood(entity)
                end,
                icon = 'fa-solid fa-tree',
                label = 'Cortar madeira',
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
            {
                type = "client",
                action = function(entity)
                    Fiber(entity)
                end,
                icon = 'fa-solid fa-plant-wilt',
                label = 'Retirar fibra',
                item = "WEAPON_KNIFE",
                canInteract = function(entity, distance, data) -- Isso verificará se você pode interagir com ele, isso não aparecerá se retornar falso, isso é OPCIONAL
                    local knifes = exports.ox_inventory:Search('slots', 'WEAPON_KNIFE')
                    local count = 0
                    for _, v in pairs(knifes) do
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

function Wood(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = "wood"

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

function Fiber(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = "fiber"

    local progressLabel = 'Cortando fibras...'

    local anim = {
        animDict = "creatures@rottweiler@tricks@",
        name = "petting_franklin",
        crouch = true
    }

    local time = 30

    TriggerEvent("pz_loot:CL:initial", prop, propData, type, time, anim, nil, progressLabel, false)
end

