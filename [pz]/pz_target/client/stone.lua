CreateThread(function()
    local models = {
        "proc_stones_05", "proc_stones_06", "proc_stones_01", "proc_stones_03", "proc_stones_02", "proc_stones_04", "prop_coral_stone_03",
        "prop_coral_stone_04", "prop_rock_4_c", "prop_rock_4_c_2", "rock_4_cl_2_2", "prop_rock_4_d", "prop_rock_3_b", "prop_rock_2_a", "prop_rock_1_f",
        "prop_rock_4_a", "prop_rock_1_g", "prop_rock_3_g", "prop_rock_1_h", "prop_rock_3_c", "prop_rock_1_e", "prop_rock_3_f", "prop_rock_4_b",
        "prop_rock_4_cl_1", "prop_rock_2_c", "prop_rock_3_h", "prop_rock_4_cl_2", "prop_rock_3_a", "prop_rock_3_j", "prop_rock_3_i", "prop_rock_5_smash3",
        "prop_rock_2_f", "prop_rock_5_smash2", "rock_4_cl_2_1", "prop_rock_1_i", "prop_rock_2_d", "prop_rock_5_b", "prop_rock_4_e", "prop_rock_5_c",
        "prop_rock_1_d", "prop_rock_5_e", "prop_rock_4_big", "prop_rock_3_e", "prop_rock_1_a", "prop_rock_2_g", "prop_rock_5_d", "prop_rock_4_big2",
        "prop_rock_5_a", "prop_rock_1_c", "prop_rock_1_b", "prop_rock_3_d", "prop_rock_5_smash1", "prop_test_rocks02", "prop_test_rocks03",
        "prop_test_rocks01", "prop_test_rocks04", "cs_x_rubmede", "cs_x_rubmedb", "cs_x_rubsmlb", "cs_x_rubmedd", "cs_x_rubsmla", "cs_x_rubsmlc",
        "cs_x_rubsmld", "cs_x_rubsmle", "cs_x_rubweea", "cs_x_weesmlb", "cs_x_rubweec", "cs_x_rubweee", "cs_x_rubsmld", "cs_x_rubsmla",
    }
    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = { -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
        {
            type = "client",
            action = function (entity)
                TriggerEvent('jim-mining:MineOre:Pick', {stone = entity, name = 'stone_'..entity})
            end, 
            icon = 'fas fa-hammer',
            label = 'Extrair Minério (Picareta)',
            item = 'pickaxe',
            -- stone = entity,
            -- name = 'stone_'..entity,
            canInteract = function(entity, distance, data) -- Isso verificará se você pode interagir com ele, isso não aparecerá se retornar falso, isso é OPCIONAL
                if GetEntityAlpha(entity) < 1 then return false end
                local pickaxes = exports.ox_inventory:Search('slots', 'pickaxe')
                local count = 0
                for _, v in pairs(pickaxes) do
                    if not v.metadata.durability then return true end
                    if v.metadata.durability and v.metadata.durability > 0 then
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
            action = function (entity)
                TriggerEvent('jim-mining:MineOre:Drill', {stone = entity, name = 'stone_'..entity})
            end, 
            icon = 'fas fa-screwdriver',
            label = 'Extrair Minério (Broca)',
            item = 'miningdrill',
            canInteract = function(entity, distance, data) -- Isso verificará se você pode interagir com ele, isso não aparecerá se retornar falso, isso é OPCIONAL
                if GetEntityAlpha(entity) < 1 then return false end
                local miningdrills = exports.ox_inventory:Search('slots', 'miningdrill')
                local count = 0
                for _, v in pairs(miningdrills) do
                    if not v.metadata.durability then return true end
                    if v.metadata.durability and v.metadata.durability > 0 then
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
            action = function (entity)
                TriggerEvent('jim-mining:MineOre:Laser', {stone = entity, name = 'stone_'..entity})
            end, 
            icon = 'fas fa-screwdriver-wrench',
            label = 'Extrair Minério (Laser)',
            item = 'mininglaser',
            canInteract = function(entity, distance, data) -- Isso verificará se você pode interagir com ele, isso não aparecerá se retornar falso, isso é OPCIONAL
                if GetEntityAlpha(entity) < 1 then return false end
                local mininglasers = exports.ox_inventory:Search('slots', 'mininglaser')
                local count = 0
                for _, v in pairs(mininglasers) do
                    if v.metadata.durability and v.metadata.durability > 0 then
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
