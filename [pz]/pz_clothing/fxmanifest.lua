fx_version 'bodacious'
lua54 'yes'
game 'gta5'

version '1.0.1'

client_scripts {
	'client.lua'
}

server_script {
  'server.lua'
}

--#--Shared Scripts--#--
shared_script '@ox_lib/init.lua'

files {
  'html/**/**/**/**/**/*',
  'html/**/**/**/**/*',
  'html/**/**/**/*',
  'html/**/**/*',
  'html/**/*',
  'html/*',
}

ui_page 'html/index.html'