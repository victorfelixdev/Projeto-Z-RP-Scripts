local alertDuration = 15 

local function createRadius(coords)
  local offset = math.random(-100, 100)
  local blip1 = AddBlipForRadius(coords.x + offset, coords.y + offset, coords.z, 500.0)
  SetBlipAlpha(blip1, 180)
  SetBlipHighDetail(blip1, true)
  SetBlipColour(blip1, 1)
  SetBlipAsShortRange(blip1, true)
  SetBlipSprite(blip1, 161)

  local blip2 = AddBlipForCoord(coords.x + offset, coords.y + offset, coords.z)
  SetBlipSprite(blip2, 458)
  SetBlipScale(blip2, 1.0)
  SetBlipColour(blip2, 1)
  SetBlipAsShortRange(blip2, true)
  BeginTextCommandSetBlipName('STRING')
  AddTextComponentSubstringPlayerName("Acesso não autorizado")
  EndTextCommandSetBlipName(blip2)

  -- Remover os blips após 5 minutos (300000 ms)
  CreateThread(function()
    Wait(300000) -- 5 minutos
    RemoveBlip(blip1)
    RemoveBlip(blip2)
  end)

  return blip1, blip2
end

local function playSoundAlert()
  local timer = alertDuration
  while true do
    PlaySoundFrontend(-1, 'Hack_Failed', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 1)
    Wait(250)
    PlaySoundFrontend(-1, 'Hack_Failed', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 1)
    Wait(250)
    PlaySoundFrontend(-1, 'Hack_Failed', 'DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS', 1)
    Wait(1000)
    timer = timer - 1
    if timer < 1 then break end
  end
end

RegisterNetEvent('pz_gov:CL:markWaypointToLaptop', function(coords)
  lib.notify({
    type = 'warning',
    title = 'Sinal de Desconhecido',
    description = 'Uma nova conexão não autorizada foi detectada na rede do governo.'
  })
  createRadius(coords)
  playSoundAlert()
end)
