fx_version "cerulean"
game "gta5"

author "cStudio"
description "Los Santos Metro System"
version '1.1.1'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js',
}

ui_page 'ui/index.html'

server_scripts {
    "server/server.lua",
    "config.lua",
    "server/version_checker.lua"
}

client_scripts{
    "config.lua",
    "client/client.lua",
	"client/metro.lua"
}

shared_scripts {
    -- '@ox_lib/init.lua',
    'config.lua',
    '@es_extended/imports.lua'
}

this_is_a_map 'yes'

lua54 "yes"

escrow_ignore {
    'config.lua'
}