fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'
use_fxv2_oal 'yes'

author 'Cheesper'
description 'Sistema de Tutorial'
version '1.0.0'

shared_scripts {
  '@ox_lib/init.lua',
  '@qb-core/shared/locale.lua',
  "**/**/config.lua",
	"**/**/shared/*",
	"**/**/utils/*",
} 

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  "**/**/server/*",
}
client_script {
  "**/**/client/*",
}

ui_page 'web-side/index.html'
files {
  "web-side/*",
	"web-side/**/*"
}