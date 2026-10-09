local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('pz_presence:server:GetCurrentPlayers', function(_, cb)
    cb(#GetPlayers())
end)