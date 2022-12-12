---@param str string string for indexing
---@param index number the index of the character
---@return string char the character
string.character_at = function (str, index)
    if index > #str then error("attempt to index out of bounds") end

    return string.sub(str, index, index)
end