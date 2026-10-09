fx_version 'cerulean'
game 'gta5'
use_experimental_fxv2_oal 'yes'
lua54 'yes'

description 'pz_loot - Team Projeto Z RP'
version '2.0.1'

shared_scripts {
	'config/sh_config.lua',
	'@ox_lib/init.lua',
}

client_scripts {'client/*.lua'}

server_scripts {
	'@oxmysql/lib/MySQL.lua', 
	'server/*.lua',
	'config/*.lua'
}

lua54 'yes'

files {
	'data/misc_sounds.dat54.rel',
	'audiodirectory/misc_sounds.awc',
}

data_file 'AUDIO_WAVEPACK' 'audiodirectory'
data_file 'AUDIO_SOUNDDATA' 'data/misc_sounds.dat'
