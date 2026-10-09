CreateThread(function()
    local models = {
        "s_m_y_cop_01"
    }

    exports['qb-target']:AddTargetModel(models, { 
        options = {
            {
                type = "client",
                action = function(entity)
                    Police(entity)
                end,
                icon = 'fa-solid fa-skull',
                label = 'Revistar Policial',
                canInteract = function(entity, distance, data) -- Isso verificará se você pode interagir com ele, isso não aparecerá se retornar falso, isso é OPCIONAL
                    local targetServerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))
                    local data = lib.callback.await('ars_ambulancejob:getData', false, targetServerId)
                    if data.status.isDead or GetEntityHealth(entity) ~= 0 then
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

function Police(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'police'

    local progressLabel = 'Revistando policial...'

    local anim = {
        animDict = "anim@gangops@facility@servers@bodysearch@",
        name = "player_search",
        crouch = true
    }

    local time = 3600

    local sound = {
        name = "body_searching",
        playSound = true,
        soundset = "misc_soundset",
        audiobank = "audiodirectory/misc_sounds",
    }

    TriggerEvent("pz_loot:CL:multi", prop, propData, type, time, anim, sound, progressLabel, true)
end