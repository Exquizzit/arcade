luaunit = require('src.lib.luaunit')

require('src.tests.command_util_tests')

os.exit( luaunit.LuaUnit.run() )