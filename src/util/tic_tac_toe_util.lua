tic_tac_toe_current_games = {}

tiles = {
    "1️⃣", "2️⃣", "3️⃣",
    "4️⃣", "5️⃣", "6️⃣",
    "7️⃣", "8️⃣", "9️⃣"
}

---@param table_of_tiles table
function tiles_to_message(table_of_tiles, status_message)
    local message = table_of_tiles[1] .. " " .. table_of_tiles[2] .. " " .. table_of_tiles[3] .. " \n" .. table_of_tiles[4] .. " " .. table_of_tiles[5] .. " " .. table_of_tiles[6] .. " \n" .. table_of_tiles[7] .. " " .. table_of_tiles[8] .. " " .. table_of_tiles[9] .. " \n" .. status_message
    return message
end

function is_player_in_game(user)
    for i, game in ipairs(tic_tac_toe_current_games) do
        if game:is_player_in_game(user) then return true end
    end
end

---comment
---@param tiles_to_check any
---@return string result "continue" if nothing ends the game, "draw" if a draw
function check_tiles_for_end(tiles_to_check)
    if check_for_draw(tiles_to_check) then return "draw" end

    local horizontal_winner, vertical_winner, diagonal_winner = check_horizontals(tiles_to_check), check_verticals(tiles_to_check), check_diagonals(tiles_to_check)

    if horizontal_winner ~= 0 then return "winner player" .. horizontal_winner end
    if vertical_winner ~= 0 then return "winner player" .. vertical_winner end
    if diagonal_winner ~= 0 then return "winner player" .. diagonal_winner end

    return "continue"
end

---comment
---@param tiles_to_check table
---@return boolean draw returns true if there's a draw
function check_for_draw(tiles_to_check)
    for i, t in ipairs(tiles) do
        if table.find(tiles_to_check, t) then return false end
    end

    return true
end

---@param tiles_to_check table
---@return boolean three_horizontally returns the player index of the winner if there's 3 horizontally, otherwise 0
function check_horizontals(tiles_to_check)
    for i = 0, 2, 1 do
        local index_first_tile_horizontally = i * 3 + 1
        local to_check = tiles_to_check[index_first_tile_horizontally]
        if (tiles_to_check[index_first_tile_horizontally + 1] == to_check) and (tiles_to_check[index_first_tile_horizontally + 2] == to_check) then return true end
    end

    return false
end

---@param tiles_to_check table
---@return boolean three_vertically returns the player index of the winner if there's 3 vertically, otherwise 0
function check_verticals(tiles_to_check)
    for i = 1, 3, 1 do
        local index_first_tile_horizontally = i * 3 + 1
        local to_check = tiles_to_check[index_first_tile_horizontally]
        if (tiles_to_check[index_first_tile_horizontally + 1] == to_check) and (tiles_to_check[index_first_tile_horizontally + 2] == to_check) then return true end
    end

    return false
end

---@param tiles_to_check table
---@return number three_diagonally returns the player index of the winner if there's 3 diagonally, otherwise 0
function check_diagonals(tiles_to_check)

end