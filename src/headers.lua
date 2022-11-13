class = discordia.class

-- Globals
local tokenFile = io.open('./bot/token.txt')
_G.TOKEN = tokenFile:read('*a')

PREFIX = "!"