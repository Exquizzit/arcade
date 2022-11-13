class = discordia.class

-- Globals
local tokenFile = io.open('./bot/token.txt')
_G.TOKEN = tokenFile:read('*a')

PREFIX = "!"

require('src.util.command_util') -- string util is required here
require('src.util.table_util')