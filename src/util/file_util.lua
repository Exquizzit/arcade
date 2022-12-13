require("src.util.table_util")

function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    for filename in popen('dir "'..directory..'" /b'):lines() do
        i = i + 1
        t[i] = filename
    end
    return t
end

---@param directory_path string
---@param except table | nil
function require_in_directory(directory_path, except)
    -- Directory path is in dots
    local path_as_forward_slashes = string.gsub(directory_path, "%.", "/")

    for i, filename in ipairs(scandir(path_as_forward_slashes)) do
        local filename_without_dotlua = string.sub(filename, 1, #filename - 4)

        if except ~= nil and (table.find(except, filename_without_dotlua) ~= -1)  then goto continue end

        require(directory_path .. "/" .. filename_without_dotlua)
        ::continue::
    end
end