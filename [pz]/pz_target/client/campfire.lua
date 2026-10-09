CreateThread(function()
    local models = {
        "prop_beach_fire"
    }

    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = { -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
        {
            type = "client",
            action = function (entity)
                TriggerEvent('ars_hunting:accessCampfire', entity)
            end, 
            icon = 'fa-solid fa-fire-burner',
            label = 'Fogueira',
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
