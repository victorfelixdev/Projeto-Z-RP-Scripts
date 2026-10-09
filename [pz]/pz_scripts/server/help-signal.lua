RegisterNetEvent('pz_scripts:SV:HelpSignal', function()
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(src))
    TriggerClientEvent('pz_scripts:CL:HelpSignal', src)
    TriggerClientEvent('pz_scripts:CL:ReceiveHelpSignal', -1, coords)
end)