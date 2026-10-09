fx_version 'cerulean'
game 'gta5'
use_experimental_fxv2_oal 'yes'
lua54 'yes'

author 'Cheesper'
description 'Scripts simples do Projeto Z'
version '1.5.7'

client_scripts {'client/*.lua'}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
  'server/*.lua',
}

shared_scripts {
  '@ox_lib/init.lua',
  'config/*.lua',
}