fx_version 'bodacious'
games {'gta5'}

author 'PZ Infection System'
description 'Zombie Infection'
version '1.0'
lua54 'yes'

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/path_to_left_icon.png',
    'ui/path_to_right_icon.png'
}

shared_scripts {
    '@ox_lib/init.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

client_scripts {
    'client.lua'
}

exports {
    'onZombieAttackPed'
}

files {
	'data/infection_sounds.dat54.rel',
	'audiodirectory/infection_sounds.awc',
}

data_file 'AUDIO_WAVEPACK' 'audiodirectory'
data_file 'AUDIO_SOUNDDATA' 'data/infection_sounds.dat'
