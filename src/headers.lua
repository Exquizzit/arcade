class = discordia.class

-- Globals
local tokenFile = io.open('./bot/token.txt')
_G.TOKEN = tokenFile:read('*a')

PREFIX = "!"

-- Discordia
Clock = require('../deps/discordia/libs/utils/Clock')

-- Util
require('src.util.file_util')
require_in_directory('src.util', { "file_util", "table_util"})

-- Managers
require_in_directory('src.modules')