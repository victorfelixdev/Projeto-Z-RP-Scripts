CreateThread(function()
    local models = { "ex_prop_ex_toolchest_01", "gr_prop_gr_tool_chest_01a", "gr_prop_gr_tool_draw_01a",
        "gr_prop_gr_tool_draw_01b",
        "gr_prop_gr_tool_draw_01d", "imp_prop_tool_cabinet_01a", "imp_prop_tool_cabinet_01b", "imp_prop_tool_cabinet_01c",
        "imp_prop_tool_chest_01a", "imp_prop_tool_draw_01a", "imp_prop_tool_draw_01c", "imp_prop_tool_draw_01d",
        "imp_prop_tool_draw_01e",
        "prop_toolchest_01", "prop_toolchest_02", "prop_toolchest_03", "prop_toolchest_03_l2", "prop_toolchest_04",
        "prop_toolchest_05",
        "xm_prop_x17_tool_draw_01a", "gr_prop_gr_tool_box_01a", "gr_prop_gr_tool_box_02a", "imp_prop_tool_box_01a",
        "imp_prop_tool_box_01b",
        "imp_prop_tool_box_02a", "imp_prop_tool_box_02a", "imp_prop_tool_box_02b", "prop_tool_box_01", "prop_tool_box_04",
        "prop_tool_box_06",
        588518019, 981656679
    }

    exports["qb-target"]:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = {                               -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
            {
                type = "client",
                action = function(entity)
                    Mechanic(entity)
                end,
                icon = 'fa-solid fa-toolbox',
                label = 'Procurar peças',
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

function Mechanic(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = "mechanic"

    local progressLabel = 'Procurando peças...'

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

    TriggerEvent("pz_loot:CL:multi", prop, propData, type, time, anim, sound, progressLabel, true)
end
