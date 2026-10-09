CreateThread(function()
    local models = {
        "mp_el_boomer_normal"
        ,"abomination"
        ,"desert_giant"
        ,"Nemesis_Big"
        ,"arctic_hazmat"
        ,"makeshift"
        ,"rust_nomad"
        ,"rust_scientist"
        ,"Baphomet"
        ,"bloater"
        ,"chicken"
        ,"FatDemon2"
        ,"FemaleClicker"
        ,"Laura"
        ,"LocustBoomer"
        ,"MutantZ6"
        ,"Necromutant"
        ,"shambler"
        ,"zombie2"
        ,"zombie3"
        ,"zombie4"
        ,"zombie5"
        ,"zombie6"
    }

    exports['qb-target']:AddTargetModel(models, { 
        options = {
            {
                type = "client",
                action = function(entity)
                    Boss(entity)
                end,
                icon = 'fa-solid fa-skull',
                label = 'Revistar Criatura',
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

function Boss(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'boss'

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