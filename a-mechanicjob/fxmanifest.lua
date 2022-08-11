fx_version "cerulean"
game "gta5"

name "mechanicjob"
description "Mechanic Job"
author "ARtuRO"

client_scripts {
	'@es_extended/locale.lua',
	"Client/Modules/*.lua",
	"Config/*.lua",
	"Client/*.lua"
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    	'@es_extended/locale.lua',
	"Config/*.lua",
	"Server/*.lua"
}
