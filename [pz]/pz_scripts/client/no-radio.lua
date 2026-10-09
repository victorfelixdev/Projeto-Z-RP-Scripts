lib.onCache('vehicle', function(vehicle)
  if vehicle then
      SetVehicleRadioEnabled(vehicle, false)
      SetVehRadioStation(vehicle, 'OFF')
  end
end)