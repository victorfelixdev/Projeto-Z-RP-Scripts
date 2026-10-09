fx_version 'adamant'
game 'gta5'

version '1.0.0'
description 'pz_radioactive - Team Projeto Z RP'

client_scripts {'configs/*.lua', 'client/*.lua'}

server_scripts {'configs/*.lua', 'server/*.lua'}

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
}