luaunit = require('src.lib.luaunit')

function test_ReadAllFilesInDir()
    local all_filenames = {}
    local expected_filenames = {"token.txt"}
    local dir_to_search = "bot"

    for i, filename in ipairs(scandir(dir_to_search)) do
        table.insert(all_filenames, filename)
    end

    luaunit.assertEquals(all_filenames, expected_filenames)
end