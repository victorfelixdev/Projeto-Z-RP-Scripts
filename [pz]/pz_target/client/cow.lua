CreateThread(function()
  local models = {"a_c_cow"}

  exports['qb-target']:AddTargetModel(models, {
      options = {
      {
          type = "client",
          action = function(entity)
            Cow(entity)
        end,
          icon = 'fa-solid fa-cow',
          label = 'Esfolar a Vaca',
          item = 'WEAPON_KNIFE',

          canInteract = function(entity, distance, data)
              local hatchets = exports.ox_inventory:Search('slots', 'WEAPON_KNIFE')
              local count = 0
              for _, v in pairs(hatchets) do
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

function Cow(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'hunting-cow'
  
    local progressLabel = 'Esfolando vaca...'
  
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
