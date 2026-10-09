fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'
use_fxv2_oal 'yes'

author 'Cheesper'
description 'Sistema de logs'
version '1.0.0'

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua'
}

server_scripts {
  'server.lua',
  '@oxmysql/lib/MySQL.lua',
}
