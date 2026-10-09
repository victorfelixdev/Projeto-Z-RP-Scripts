local adminGroups = lib.load("config/sh_config").adminGroup

local freecamCommand = lib.load("config/sh_config").freecamCommand
lib.addCommand(freecamCommand, {
    help = "Ativa/Desativa a Freecam",
    restricted = adminGroups
}, function(source)
    TriggerClientEvent('pz_scripts:CL:ToggleFreecam', source)
end)