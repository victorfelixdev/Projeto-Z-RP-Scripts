CreateThread(function()
  local models = {
      "prop_bush_med_02"
  }

  exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
      options = { -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
      {
          type = "client",
          action = function(entity)
            Aloe(entity)
        end,
          icon = 'fa-solid fa-box-open',
          label = 'Cortar babosa',
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

function Aloe(entity)
    local prop = entity
  local propData = GetEntityModel(entity)
  local type = 'aloe'

  local progressLabel = 'Cortando babosa...'

  local anim = {
      animDict = "anim@gangops@facility@servers@bodysearch@",
      name = "player_search",
      crouch = true
  }
  
  local time = 30

  local sound = {
      name = "searching",
      playSound = true,
      soundset = "misc_soundset",
      audiobank = "audiodirectory/misc_sounds",
  }

  TriggerEvent("pz_loot:CL:initial", prop, propData, type, time, anim, sound, progressLabel, true)
end