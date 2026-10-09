lib.addCommand('flare', {
    help = 'Dispara um flare',
    params = {},
    restricted = 'group.admin'
}, function(source, args, raw)
    TriggerClientEvent('pz_playground:CL:FlareShoot', source)
end)