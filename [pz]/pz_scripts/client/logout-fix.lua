AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
  FreezeEntityPosition(PlayerPedId(),false)
end)