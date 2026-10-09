local QBCore = exports["qb-core"]:GetCoreObject()

Config = {}
Config.ragdollOnZombieAttackProbability = 10

local function onZombieAttackPed(zombie, ped, damage)
    local ShakeIntensity = 0.2
    local shakeWait = 50
    local hitSounds = { "hit1", "hit2", "hit3" }
    local randomHitSound = hitSounds[math.random(#hitSounds)]

    ApplyDamageToPed(ped, damage, false)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, randomHitSound, 0.1)
    SetTimecycleModifier('glasses_red')
    SetTimecycleModifierStrength(1.0)
    ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", ShakeIntensity)
    Wait(shakeWait)
    SetTimecycleModifier('Default')
    local damageAmount = damage -- Cantidad de daño que deseas aplicar
    TriggerEvent("playerDamage", damageAmount)

    if Config.ragdollOnZombieAttackProbability then
        local rdm = math.random(1, 100)

        if rdm <= Config.ragdollOnZombieAttackProbability then
            SetPedToRagdoll(ped, 1000, 1000, 0, false, false, false)
        end
    end
    local probabilidadInfeccion = 5
    local numeroAleatorio = math.random(1, 100)
    if numeroAleatorio <= probabilidadInfeccion then
        TriggerServerEvent("pz_infection:SV:updatePlayerInfection", 1)
    end
end

exports("onZombieAttackPed", onZombieAttackPed)

CreateThread(function()
    while true do
        Wait(60000 * 1) -- Esperar el intervalo de tiempo
        local targetServerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(cache.ped))
        local data = lib.callback.await('ars_ambulancejob:getData', false, targetServerId)
        local isDead = data.status.isDead
        if not isDead then
            TriggerServerEvent("pz_infection:SV:checkInfection")
        end
    end
end)

RegisterNetEvent('pz_infection:CL:SetDrunkMode', function()
    RequestAnimSet("move_m@drunk@verydrunk")
    HasAnimSetLoaded("move_m@drunk@verydrunk")
    SetPedMovementClipset(cache.ped, "move_m@drunk@moderatedrunk", true)
    SetPedMotionBlur(cache.ped, true)
    SetPedIsDrunk(cache.ped, true)
    StartScreenEffect("DrugsTrevorClownsFight", 0, false)
    Wait(30000)
    StopScreenEffect('DrugsMichaelAliensFight')
    StopScreenEffect('DrugsTrevorClownsFight')
    ClearTimecycleModifier()
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(cache.ped, 0)
    SetPedIsDrunk(cache.ped, false)
    SetPedMotionBlur(cache.ped, false)
end)

RegisterNetEvent("pz_infection:CL:infectedPlayers", function(infectstate)
    local soundId = GetSoundId()
    RequestScriptAudioBank('audiodirectory/infection_sounds', true)
    local gender = GetEntityModel(cache.ped) == GetHashKey("mp_f_freemode_01") and "female" or "male"
    if infectstate >= 15 and infectstate < 34 then
        ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.02)
    elseif infectstate >= 35 and infectstate < 55 then
        lib.notify({type = 'error', description = 'Acho que eu tô me sentindo estranho...', position = 'bottom'})
        ApplyDamageToPed(cache.ped, 2, false)
        SetFlash(0, 0, 150, 2000, 150)
        ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
        exports.scully_emotemenu:playEmoteByCommand('cough')
        if gender == "male" then
            PlaySoundFromEntity(soundId, 'tos', cache.ped, 'infection_soundset', true, 0)
        else
            PlaySoundFromEntity(soundId, 'tosmujer', cache.ped, 'infection_soundset', true, 0)
        end
        Wait(3000)
        exports.scully_emotemenu:cancelEmote()
    elseif infectstate >= 55 and infectstate < 90 then
        ApplyDamageToPed(cache.ped, 5, false)
        ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)
        SetFlash(0, 0, 500, 4200, 500)
        lib.notify({type = 'error', description = 'Droga, acho que eu fui infectado!', position = 'bottom'})
        exports.scully_emotemenu:playEmoteByCommand('cough')
        if gender == "male" then
            PlaySoundFromEntity(soundId, 'tos', cache.ped, 'infection_soundset', true, 0)
        else
            PlaySoundFromEntity(soundId, 'tosmujer', cache.ped, 'infection_soundset', true, 0)
        end
        Wait(3000)
        exports.scully_emotemenu:cancelEmote()
    elseif infectstate >= 90 and infectstate < 95 then
        TriggerEvent('pz_infection:CL:SetDrunkMode')
        ApplyDamageToPed(cache.ped, 5, false)
        ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)
        SetFlash(0, 0, 500, 4200, 500)
        lib.notify({type = 'error', description = 'Que dor...', position = 'bottom'})
        
        if gender == "male" then
            PlaySoundFromEntity(soundId, 'scream_male', cache.ped, 'infection_soundset', true, 0)
        else
            PlaySoundFromEntity(soundId, 'scream_female', cache.ped, 'infection_soundset', true, 0)
        end
        exports.scully_emotemenu:playEmoteByCommand('zombiescream')
        Wait(2500)
        SetFlash(0, 0, 500, 1500, 500)
        exports.scully_emotemenu:cancelEmote()
    elseif infectstate >= 95 and infectstate < 100 then
        ApplyDamageToPed(cache.ped, 10, false)
        ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.2)
        SetFlash(0, 0, 500, 3000, 500)
        lib.notify({type = 'error', description = 'Que dor...', position = 'bottom'})
        exports.scully_emotemenu:playEmoteByCommand('zombieagony')
        
        if gender == "male" then
            PlaySoundFromEntity(soundId, 'scream_male', cache.ped, 'infection_soundset', true, 0)
        else
            PlaySoundFromEntity(soundId, 'scream_female', cache.ped, 'infection_soundset', true, 0)
        end
        Wait(8000)
        SetFlash(0, 0, 500, 1500, 500)
        exports.scully_emotemenu:cancelEmote()
    elseif infectstate >= 100 then
        exports.scully_emotemenu:playEmoteByCommand('fallover')
        Wait(5000)
        exports.scully_emotemenu:cancelEmote()
        TriggerEvent('qbx_admin:client:killPlayer')
    end

    StopSound(soundId)
end)

RegisterNetEvent('pz_infection:CL:updateInfectionUI', function(level)
    SendNUIMessage({
        type = 'updateInfection',
        level = level
    })
end)

RegisterNetEvent('pz_infection:CL:reduceInfection', function()

    local success = lib.progressBar({
        duration = math.random(2000, 3000),
        label = 'Tomando remédio...',
        useWhileDead = false,
        canCancel = false,
        disable = {
            move = false,
            car = false,
            mouse = false,
            combat = true
        },
        anim = {
            dict = 'switch@trevor@trev_smoking_meth',
            clip = 'trev_smoking_meth_loop',
            flag = 49
        }
    })

    if success then
        lib.notify({type = 'success', description = 'Acho que me sinto um pouco melhor', position = 'bottom'})
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        Citizen.Wait(1000)
        TriggerServerEvent('checkInfection')
    end
end)

AddEventHandler('playerSpawned', function()
    Citizen.Wait(1000)
    TriggerServerEvent('checkInfection')
end)
