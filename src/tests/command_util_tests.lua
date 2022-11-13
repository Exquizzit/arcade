luaunit = require('src.lib.luaunit')
require('src.util.command_util')

function test_MessageToCommand()
    local message = "!test a b c"

    local message_as_command = message_to_command(message)
    local expected = { "test", "a", "b", "c" }

    luaunit.assertEquals(message_as_command, expected)
end