---- server.lua ----
local QBCore = exports['qb-core']:GetCoreObject()

local function registerWeaponStates(vehicleNetId)
    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
    for weaponHash, data in pairs(Config.AmmoType) do
        local weapons = Entity(vehicle).state.weapons or {}
        table.insert(weapons, {
            weapon = weaponHash,
            ammo = 0,
            maxAmmo = data.maxAmmo,
            firerate = data.firerate,
            ammoType = data.ammoType,
            reloadTime = data.reloadTime,
            canReloadWhileRunning = data.canReloadWhileRunning,
            disabled = data.disabled
        })

        Entity(vehicle).state:set('weapons', weapons, true)
    end
    return vehicle
end

lib.callback.register('pz_vehicles:SV:registerVehicleWeapon', function(source, VehicleNetId)
    return registerWeaponStates(VehicleNetId)
end)

-- Init existing vehicles
CreateThread(function()
    for _, vehicle in ipairs(GetGamePool('CVehicle')) do
        local VehicleNetId = NetworkGetNetworkIdFromEntity(vehicle)
        registerWeaponStates(VehicleNetId)
    end
end)

-- New vehicles
AddEventHandler('entityCreated', function(entity)
    if GetEntityType(entity) == 2 then
        local VehicleNetId = NetworkGetNetworkIdFromEntity(entity)
        registerWeaponStates(VehicleNetId)
    end
end)

-- -- Reduz munição
-- dispatchReduce = 'vehicleAmmo:server:reduceAmmo'
RegisterNetEvent('pz_vehicles:server:reduceAmmo', function(netId, weapon)
    local vehicle = NetworkGetEntityFromNetworkId(netId)
    local weapons = Entity(vehicle).state.weapons
    for i, weaponState in pairs(weapons) do
        if weaponState.weapon == weapon.weapon then
            local current = weapon.ammo or 0
            local newAmmo = current > 0 and (current - 1) or 0
            weapon.ammo = newAmmo
            weapons[i] = weapon
            Entity(vehicle).state:set('weapons', weapons, true)
          break
        end
    end
end)

-- -- Troca arma
RegisterNetEvent('pz_vehicles:server:changeWeapon', function(netId, wHash)
    local vehicle = NetworkGetEntityFromNetworkId(netId)
    Entity(vehicle).state:set('selectedWeapon', wHash, true)
end)

-- Reload munição
RegisterNetEvent('pz_vehicles:SV:reloadAmmo', function(netId, weaponHash, amountToUse)
    local src = source
    local vehicle = NetworkGetEntityFromNetworkId(netId)
    local weapons = Entity(vehicle).state.weapons
    local weapon, weaponIndex
    for i, weaponState in pairs(weapons) do
        if weaponState.weapon == weaponHash then
          weapon = weaponState
          weaponIndex = i
          break
        end
    end
    local current = weapon.ammo or 0
    local newAmmo = math.min(current + amountToUse, weapon.maxAmmo)
    weapon.ammo = newAmmo
    weapons[weaponIndex] = weapon
    Entity(vehicle).state:set('weapons', weapons, true)
    -- consome e notifica
    exports.ox_inventory:RemoveItem(src, weapon.ammoType, amountToUse)
    lib.notify(src, {
        title = 'Arma do Veículo',
        description = 'Você usou '..amountToUse..'x munições',
        type = 'success',
        duration = 5000,
      })
end)
