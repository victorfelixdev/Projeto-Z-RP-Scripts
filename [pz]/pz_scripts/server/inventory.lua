lib.addCommand('weight', {
    help = 'Seta a capacidade de peso de um Player',
    params = {
        {
            name = 'id',
            type = 'number',
            help = 'ID do Player',
        },
        {
            name = 'quantity',
            type = 'number',
            help = 'Tamanho',
        },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    if not args.id then args.id = source end
    exports.ox_inventory:SetMaxWeight(args.id, args.quantity*1000)
end)

lib.addCommand('slots', {
    help = 'Seta a capacidade de slots de um Player',
    params = {
        {
            name = 'id',
            type = 'number',
            help = 'ID do Player',
        },
        {
            name = 'quantity',
            type = 'number',
            help = 'Tamanho',
        },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    if not args.id then args.id = source end
    exports.ox_inventory:SetSlotCount(args.id, args.quantity)
end)