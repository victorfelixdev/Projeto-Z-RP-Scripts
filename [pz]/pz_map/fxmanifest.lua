fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_fxv2_oal 'yes'

author 'Cheesper'
description 'Sistema de mapa do Projeto Z RP'
version '1.0.0'

client_scripts {
    'client/*'
}

server_scripts {
    'server/*',
    '@oxmysql/lib/MySQL.lua',
}

dependencies {
    'qb-core',
    'ox_lib',
    'ox_inventory',
}

dependencies {
    'qb-core',
    'ox_lib',
    'ox_inventory'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config/config.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css'
}
