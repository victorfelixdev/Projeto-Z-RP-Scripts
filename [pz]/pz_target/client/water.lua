CreateThread(function()
    local models = {"prop_cactus_01e", "prop_cactus_01a", "prop_cactus_03", "prop_cactus_01d", "prop_cactus_01c",
                    "prop_cactus_02", "prop_cactus_01b"}

    exports['qb-target']:AddTargetModel(models, { -- Isso define os modelos, pode ser uma string ou uma tabela
        options = { -- Esta é sua tabela de opções, nesta tabela todas as opções serão especificadas para o destino aceitar
        {
            type = "client",
            action = function(entity)
                Cactus(entity)
            end,
            icon = 'fa-solid fa-droplet',
            label = 'Cortar Cácto',
            item = 'WEAPON_KNIFE',
            canInteract = function(entity, distance, data) -- Isso verificará se você pode interagir com ele, isso não aparecerá se retornar falso, isso é OPCIONAL
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
                if data.status.isDead then
                    return false
                else
                    return true
                end
            end
        },
        {
            type = "client",
            action = function(entity)
                Aloe(entity)
            end,
            icon = 'fa-solid fa-plant-wilt',
            label = 'Cortar Babosa',
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

function Cactus(entity)
    local prop = entity
    local propData = GetEntityModel(entity)
    local type = 'cactus'

    local progressLabel = 'Cortando cácto...'

    local anim = {
        animDict = "melee@hatchet@streamed_core",
        name = "plyr_front_takedown",
        crouch = false,
        prop = 'prop_knife',
        coords = vec3(0.07, 0.11, 0.03),
        rotation = vec3(21.84, 0.0, 0.0),
        bone = 28422
    }

    local time = 1

    local sound = {
        name = "wood_cut",
        playSound = true,
        soundset = "dlc_heist_fleeca_sounds",
        audiobank = nil,
    }

    TriggerEvent("pz_loot:CL:initial", prop, propData, type, time, anim, sound, progressLabel, false)
end

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