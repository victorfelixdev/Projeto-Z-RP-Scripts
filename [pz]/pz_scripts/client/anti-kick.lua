CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local idle = 1000
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(vehicle, 0) == ped and GetVehicleClass(vehicle) == 8 then
                idle = 250
                DisableControlAction(0, 73, true)
            end
        end
        Wait(idle)
    end
end)
