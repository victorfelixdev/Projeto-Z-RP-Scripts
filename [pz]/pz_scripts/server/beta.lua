lib.addCommand('beater', {
    help = 'Gera um Beater',
    params = {
        {
            name = 'name',
            type = 'string',
            help = 'Nome do Player',
        },
        {
            name = 'target',
            type = 'number',
            help = 'ID do Player',
        },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    if not args.target then args.target = source end

    local metadata = {
        description = 'Um pequeno gesto de gratidão aos nossos Beaters (Sim... referência ao melhor anime do mundo). Obrigado pelo seu apoio ao longo de todos esses anos e por nunca desistir do Projeto Z.',
        durability = 100,
        label = 'Beater (@'.. args.name ..')'
    }
    exports.ox_inventory:AddItem(args.target, 'WEAPON_BAT', 1, metadata)
end)

lib.addCommand('sound', {
    help = 'som',
    params = {
        {
            name = 'name',
            type = 'string',
            help = 'Nome do Som',
        },
        {
            name = 'soundset',
            type = 'string',
            help = 'Soundset',
        },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    TriggerClientEvent("pz_scripts:CL:PlaySound", source, args.name, args.soundset)
    Wait(180)
    TriggerClientEvent("pz_scripts:CL:PlaySound", source, args.name, args.soundset)
    Wait(180)
    TriggerClientEvent("pz_scripts:CL:PlaySound", source, args.name, args.soundset)
end)
lib.addCommand('alarm', {
    help = 'alarme',
    params = {
        {
            name = 'name',
            type = 'string',
            help = 'Nome do Alarme',
        },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    TriggerClientEvent("pz_scripts:CL:PlayAlarm", source, args.name)
end)