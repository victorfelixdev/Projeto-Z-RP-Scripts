CreateThread(function()
    local models = {
        "p_oil_pjack_03_s", "p_oil_pjack_02_s", "p_oil_pjack_01_s", "prop_storagetank_02b"
    }

    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = {                               -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
            {
                type = "client",
                action = function(entity)
                    Diesel(entity)
                end,
                icon = 'fa-solid fa-gas-pump',
                label = 'Procurar Diesel',
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

function Diesel(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'diesel'

    local progressLabel = 'Procurando diesel...'

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
