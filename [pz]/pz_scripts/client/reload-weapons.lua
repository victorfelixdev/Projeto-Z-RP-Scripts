local weaponAdded = true
lib.onCache('weapon', function(value)

    local isAdmin = LocalPlayer.state.isAdmin
    if isAdmin then return end
    if not value then ResetPedWeaponMovementClipset(cache.ped, 0.0) return end
    Wait(5)

    if not weaponAdded then
        GiveWeaponToPed(cache.ped, GetHashKey("weapon_petrolcan"), 0, false, true)
        RemoveWeaponFromPed(cache.ped, GetHashKey("weapon_petrolcan"))
        weaponAdded = true
    end

    local animSet = 'move_ped_wpn_jerrycan_generic'
    if not HasAnimSetLoaded(animSet) then
        RequestAnimSet(animSet)
        while not HasAnimSetLoaded(animSet) do 
            Wait(5)
        end
    end

    SetPedWeaponMovementClipset(cache.ped, animSet)
end)