fx_version 'cerulean'
lua54 'yes'
game 'gta5'

author 'orkide'
description 'orkide works jobcenter'
version '1.0.0'

shared_script 'config.lua'

client_script {
    '@ox_lib/init.lua',
    'locales.lua',
    'client.lua'
}

server_scripts {
    'locales.lua',
    'server.lua'
}


dependencies {
    'ox_target', 
    'ox_lib' 
}

escrow_ignore {
    'config.lua',
    'locales.lua' 
}

