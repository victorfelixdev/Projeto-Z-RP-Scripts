local QBCore = exports["qb-core"]:GetCoreObject()
RegisterNetEvent('pz_gov:SV:sendLaptopGovAlert', function(loc)

  print(loc)
  local GetPlayers = QBCore.Functions.GetQBPlayers()
  for id, v in pairs(GetPlayers) do
    local playerData = v.PlayerData
    if playerData.job.name == 'police' then
      TriggerClientEvent('pz_gov:CL:markWaypointToLaptop', id, loc)
    end
  end
end)