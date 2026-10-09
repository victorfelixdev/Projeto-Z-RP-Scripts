
RegisterNetEvent('QBCore:Client:EnteredVehicle', function(data)
    local seat = type(data) == "table" and data.seat or data
    local veh = type(data) == "table" and data.vehicle or data
    CreateThread(function()
        while true do
            Wait(1000)
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                if seat == -1 then
                    local speed = GetEntitySpeed(veh) * 2.236936 -- MP/h
                    if speed >= 80 then
                        SetPlayerCanDoDriveBy(PlayerId(), false)
                    else
                        SetPlayerCanDoDriveBy(PlayerId(), true)
                    end
                end
            end
        end
    end)
end)