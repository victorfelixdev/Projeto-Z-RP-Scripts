CreateThread(function()
    local models = { "prop_byard_machine02" }

    exports['qb-target']:AddTargetModel(models, {
        options = {
            {
                type = "client",
                action = function()
                    Refine()
                end,
                icon = 'fa-solid fa-recycle',
                label = 'Refinar lixo',
                canInteract = function(entity, distance, data) -- Isso verificará se você pode interagir com ele, isso não aparecerá se retornar falso, isso é OPCIONAL
                    local targetServerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))
                    local data = lib.callback.await('ars_ambulancejob:getData', false, targetServerId)
                    if data.status.isDead or GetEntityHealth(entity) == 0 then
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
function Refine()
    TriggerEvent("pz_loot:CL:recycle")
end
