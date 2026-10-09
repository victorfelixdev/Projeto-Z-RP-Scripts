CreateThread(function()
    local models = {
        "licker",
        "SwarmJuvie",
        "volatile"
    }

    exports['qb-target']:AddTargetModel(models, { 
        options = {
            {
                type = "client",
                action = function(entity)
                    BossWeak(entity)
                end,
                icon = 'fa-solid fa-skull',
                label = 'Revistar Criatura',
                canInteract = function(entity, distance, data)
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
        distance = 2.5
    })
end)

function BossWeak(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'boss_weak'

    local progressLabel = 'Revistando criatura...'

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

    TriggerEvent("pz_loot:CL:initial", prop, propData, type, time, anim, sound, progressLabel, false)
end