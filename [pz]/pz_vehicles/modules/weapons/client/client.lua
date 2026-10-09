---- client.lua ----
local QBCore = exports['qb-core']:GetCoreObject()

local function sendInfoToHud(data)
  SendNUIMessage(data)
end

local function getWeaponFromStateBag(vehicle)
  local vehicleState = Entity(vehicle).state.weapons
  while not vehicleState do
    local VehicleNetId = NetworkGetNetworkIdFromEntity(vehicle)
    lib.callback.await('pz_vehicles:SV:registerVehicleWeapon', false, VehicleNetId)
    vehicleState = Entity(vehicle).state.weapons or nil
    Wait(0)
  end
  local _, pedWeaponOnVehicle = GetCurrentPedVehicleWeapon(cache.ped)
  local selectedWeapon = tostring(pedWeaponOnVehicle)
  local weapon
  for _, weaponState in pairs(vehicleState) do
    if weaponState.weapon == selectedWeapon then
      weapon = weaponState
      break
    end
  end
  return weapon
end

local function disableFireButtons()
  local _, weaponHash = GetCurrentPedWeapon(cache.ped)
  local weapon = getWeaponFromStateBag(cache.vehicle)
  local _, pedWeaponOnVehicle = GetCurrentPedVehicleWeapon(cache.ped)
  if pedWeaponOnVehicle ~= 0 and weaponHash == 0 then
    if weapon.ammo <= 0 or weapon.disabled then
      DisablePlayerFiring(PlayerId(), true)
      DisableControlAction(0, 24, true)
      DisableControlAction(0, 25, true)
      DisableControlAction(0, 69, true)
      DisableControlAction(0, 70, true)
      DisableControlAction(0, 91, true)
      DisableControlAction(0, 92, true)
      DisableControlAction(0, 114, true)
    end
  end
end

local function checkVehicleAmmoStatus(vehicle)
  local _, pedWeaponOnVehicle = GetCurrentPedVehicleWeapon(cache.ped)
  if pedWeaponOnVehicle ~= 0 then
    local weapon = getWeaponFromStateBag(vehicle)

    sendInfoToHud({
      action = 'updateAmmo',
      ammo = weapon.ammo,
      maxAmmo = weapon.maxAmmo
    })
    LocalPlayer.state.ammoHandle = true
  end
end

lib.onCache('vehicle', function(vehicle, oldVehicle)
  if vehicle then
    checkVehicleAmmoStatus(vehicle)
  else
    sendInfoToHud({
      action = 'hide'
    })
    LocalPlayer.state.ammoHandle = false
  end
end)

AddStateBagChangeHandler('weapons', '', function(bagName, key, value, reserved, replicated)
  if not value or not GetEntityFromStateBagName then return end
  local vehicle = GetEntityFromStateBagName(bagName)
  local vehiclePedIsIn = GetVehiclePedIsIn(cache.ped, false)
  if vehicle == vehiclePedIsIn and value ~= nil then
    Wait(15)
    checkVehicleAmmoStatus(vehicle)
  end
end)

AddStateBagChangeHandler('selectedWeapon', '', function(bagName, key, value, reserved, replicated)
  if not value or not GetEntityFromStateBagName then return end
  local vehicle = GetEntityFromStateBagName(bagName)
  local vehiclePedIsIn = GetVehiclePedIsIn(cache.ped, false)
  if vehicle == vehiclePedIsIn and value ~= nil then
    Wait(15)
    checkVehicleAmmoStatus(vehicle)
  end
end)

CreateThread(function()
  while true do
    if LocalPlayer.state.ammoHandle then
      if not cache.vehicle then
        Wait(1000) 
      else
        disableFireButtons()
        Wait(0)
      end
    else
      Wait(100)
    end
  end
end)

-- Thread para detectar disparos e solicitar a redução da munição
CreateThread(function()
  while true do
    if LocalPlayer.state.ammoHandle then
      local _, pedWeaponOnVehicle = GetCurrentPedVehicleWeapon(cache.ped)
      if cache.vehicle and DoesVehicleHaveWeapons(cache.vehicle) and pedWeaponOnVehicle ~= 0 then
        local weapon = getWeaponFromStateBag(cache.vehicle)
        local currentAmmo = weapon.ammo
        if currentAmmo > 0 and IsPedShooting(cache.ped) then
          TriggerServerEvent("pz_vehicles:server:reduceAmmo", NetworkGetNetworkIdFromEntity(cache.vehicle), weapon)
        end
        Wait(weapon.firerate)
      else
        Wait(50)
      end
    else
        Wait(1000)
    end
  end
end)

CreateThread(function()
  local lastWeapon = nil
  while true do
    if LocalPlayer.state.ammoHandle then
      if IsPedInAnyVehicle(cache.ped, false) then
        -- Obtem arma atual do veículo (se houver)
        local hasWeapon, weaponHash = GetCurrentPedVehicleWeapon(cache.ped)
        if hasWeapon then
          if weaponHash ~= lastWeapon then
            -- Arma trocada: dispara evento customizado com o hash da nova arma
            TriggerServerEvent('pz_vehicles:server:changeWeapon', NetworkGetNetworkIdFromEntity(cache.vehicle), tostring(weaponHash))
            lastWeapon = weaponHash
          end
        else
          lastWeapon = nil
        end
      else
        lastWeapon = nil
      end
      Wait(0)
    else
      Wait(1000)
    end
  end
end)


RegisterNetEvent('pz_vehicles:CL:reload', function()
  local vehicle = cache.vehicle
  if not vehicle then
    lib.notify({
      title = 'Arma do Veículo',
      description = 'Você não está em um veículo',
      type = 'error',
      duration = 5000,
    })
    return
  end

  local _, pedWeaponOnVehicle = GetCurrentPedVehicleWeapon(cache.ped)
  local selectedWeapon = tostring(pedWeaponOnVehicle)
  if pedWeaponOnVehicle == 0 then
    lib.notify({
      title = 'Arma do Veículo',
      description = 'Você não está em uma arma',
      type = 'error',
      duration = 5000,
    })
    return
  end

  local state = Entity(vehicle).state.weapons
  local weapon
  for _, weaponState in pairs(state) do
    if weaponState.weapon == selectedWeapon then
      weapon = weaponState
      break
    end
  end
  local ammoItem   = weapon.ammoType
  local maxAmmo    = weapon.maxAmmo
  local reloadTime = weapon.reloadTime

  local ammoItemCount = exports.ox_inventory:GetItemCount(ammoItem)
  if not ammoItemCount or ammoItemCount <= 0 then
    lib.notify({
      title = 'Arma do Veículo',
      description = 'Sem munição suficiente ('..ammoItem..')',
      type = 'error',
      duration = 5000,
    })
    return
  end

  local isPlayerDriver = GetPedInVehicleSeat(cache.vehicle, -1) == cache.ped
  local isPlayerFlying = GetEntityHeightAboveGround(cache.ped) > 3.0
  local isEngineRunning =  GetIsVehicleEngineRunning(cache.vehicle)

    if not weapon.canReloadWhileRunning then
        if isPlayerFlying then
          lib.notify({
            title = 'Arma do Veículo',
            description = 'Não dá pra recarregar enquanto eu tô voando...',
            type = 'error',
            duration = 5000,
          })
          return
        elseif isEngineRunning then
          lib.notify({
            title = 'Arma do Veículo',
            description = 'Não dá pra recarregar com o motor ligado...',
            type = 'error',
            duration = 5000,
          })
          return
        elseif not isPlayerDriver then
          lib.notify({
            title = 'Arma do Veículo',
            description = 'Somente o motorista vai conseguir recarregar...',
            type = 'error',
            duration = 5000,
          })
          return
        end
    end

  if lib.progressBar({
    duration = reloadTime,
    label = 'Recarregando arma do veículo...',
    disable = { car=true, move=true, combat=true },
  }) then
    local toUse = math.min(ammoItemCount, maxAmmo - (weapon.ammo or 0))
    TriggerServerEvent("pz_vehicles:SV:reloadAmmo", NetworkGetNetworkIdFromEntity(vehicle), selectedWeapon, toUse)
  end
end)

RegisterCommand('+vehReload', function()
  local vehicle = cache.vehicle
  if not vehicle then return end
  TriggerEvent('pz_vehicles:CL:reload')
end, false)
RegisterKeyMapping('+vehReload', 'Recarregar arma do veículo', 'keyboard', 'R')