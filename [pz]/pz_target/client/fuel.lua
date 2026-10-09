CreateThread(function()
    local models = { "prop_tanktrailer_01a", "prop_gas_pump_old2", "prop_gas_pump_1a",
        "prop_gas_pump_old3", "prop_gas_pump_1c", "prop_gas_pump_1b", "prop_gas_pump_1b", "prop_gas_pump_1d",
        "prop_byard_gastank01", "prop_byard_gastank02", "prop_barrel_pile_03", "prop_barrel_pile_04",
        "prop_barrel_01a", 2053492827, "prop_barrel_pile_01", "prop_barrel_pile_02", "prop_barrel_exp_01c",
        "prop_barrel_exp_01a",
    }
    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = {                               -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
            {
                type = "client",
                action = function(entity)
                    Fuel(entity)
                end,
                icon = 'fa-solid fa-gas-pump',
                label = 'Procurar Gasolina',
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

function Fuel(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'fuel'

    local progressLabel = 'Procurando gasolina...'

    local anim = {
        animDict = "creatures@rottweiler@tricks@",
        name = "petting_franklin",
        crouch = false
    }

    local time = 3600

    local sound = {
        name = "searching",
        playSound = true,
        soundset = "misc_soundset",
        audiobank = "audiodirectory/misc_sounds",
    }

    TriggerEvent("pz_loot:CL:initial", prop, propData, type, time, anim, sound, progressLabel, false)
end