luaunit = require('src.lib.luaunit')

require('src.util.file_util')
require_in_directory('src.util')

require_in_directory('src.tests', { 'tester' })

os.exit( luaunit.LuaUnit.run() )