fx_version 'cerulean'
game 'gta5'
use_experimental_fxv2_oal 'yes'
lua54 'yes'

author 'Cheesper'
description 'Sistema de stash'
version '1.0.0'

client_scripts {'client/*.lua'}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
  'server/*.lua',
}

shared_scripts {
  '@ox_lib/init.lua',
  'config/*.lua',
  'utils/*.lua'
}

dependencies {
    'mri_Qobjects',
    'mri_Qstashes'
}
