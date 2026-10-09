local craftingItems = {
    {
        id = 'craftingMenuBuild',
        label = 'Construção',
        icon = 'hammer',
        onSelect = function ()
            TriggerEvent('ox_inventory:craftingEvent', 6)
        end
    },
    {
        id = 'craftingMenuFood',
        label = 'Alimentos',
        icon = 'utensils',
        onSelect = function ()
            TriggerEvent('ox_inventory:craftingEvent', 7)
        end
    },
    {
        id = 'craftingMenuTools',
        label = 'Ferramentas',
        icon = 'screwdriver',
        onSelect = function ()
            TriggerEvent('ox_inventory:craftingEvent', 8)
        end
    },
    {
        id = 'craftingMenuPets',
        label = 'Pets',
        icon = 'paw',
        onSelect = function ()
            TriggerEvent('ox_inventory:craftingEvent', 9)
        end
    },
}

local craftingMenu = {
    id = 'crafting',
    label = 'Abrir Menu de Crafting Básico',
    icon = 'pen-ruler',
    menu = 'craftingMenu'
}
lib.registerRadial({
    id = 'craftingMenu',
    items = craftingItems
})

lib.addRadialItem(craftingMenu)