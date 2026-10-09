CreateThread(function()
    local models = { "a_c_hen" }

    exports['qb-target']:AddTargetModel(models, {
        options = {
            {
                type = "client",
                action = function(entity)
                    Chicken(entity)
                end,
                icon = 'fa-solid fa-drumstick-bite',
                label = 'Esfolar a Galinha',
                item = 'WEAPON_KNIFE',

                canInteract = function(entity, distance, data)
                    local knifes = exports.ox_inventory:Search('slots', 'WEAPON_KNIFE')
                    local count = 0
                    for _, v in pairs(knifes) do
                        if v.metadata.durability > 0 then
                            count = count + v.count
                        end
                    end
                    if count < 1 then return false end
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

function Chicken(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'hunting-chicken'

    local progressLabel = 'Esfolando galinha...'

    local anim = {
        scenario = 'WORLD_HUMAN_GARDENER_PLANT',
    }

    local time = 300

    local sound = {
        name = "body_searching",
        playSound = true,
        soundset = "misc_soundset",
        audiobank = "audiodirectory/misc_sounds",
    }

    TriggerEvent("pz_loot:CL:multi", prop, propData, type, time, anim, sound, progressLabel, false)
end
