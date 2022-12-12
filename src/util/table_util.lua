---@param tbl table
---@param value any
---@return number index The index of the element, if not found -1
table.find = function(tbl, value)
    ---@type number
    local element_index = -1

    for i, v in pairs(tbl) do
        if v == value then return i end
    end

    return element_index
end