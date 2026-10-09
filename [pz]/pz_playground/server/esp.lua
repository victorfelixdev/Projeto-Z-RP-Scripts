lib.addCommand('wall', {
    help = 'Wall (Admin)',
    params = {},
    restricted = 'group.admin'
}, function(source, args, raw)
    TriggerClientEvent("pz_playground:CL:esp", source)
end)