tic_tac_toe_current_games = {}

tiles = {
    "1️⃣", "2️⃣", "3️⃣",
    "4️⃣", "5️⃣", "6️⃣",
    "7️⃣", "8️⃣", "9️⃣"
}

---@param user1 table
---@param user2 table
---@param table_of_tiles table
---@param status_message string
function tiles_to_message(user1, user2, table_of_tiles, status_message)
    local message = user_to_mention(user1) .. "vs. " .. user_to_mention(user2) .. " \n" .. table_of_tiles[1] .. " " .. table_of_tiles[2] .. " " .. table_of_tiles[3] .. " \n" .. table_of_tiles[4] .. " " .. table_of_tiles[5] .. " " .. table_of_tiles[6] .. " \n" .. table_of_tiles[7] .. " " .. table_of_tiles[8] .. " " .. table_of_tiles[9] .. " \n" .. status_message
    return message
end

function is_player_in_game(user)
    for i, game in ipairs(tic_tac_toe_current_games) do
        if game:is_player_in_game(user) then return true end
    end
end

---@param emoji string
---@return integer player_index
function emoji_to_player_index(emoji)
    if emoji == "❌" then return 1
    else return 2 end
end
---@param index number
---@return string emoji
function player_index_to_emoji(index)
    if index == 1 then return "❌"
    else return "⭕" end
end

----------------------------------------
---------- Checking functions ----------
----------------------------------------

---@param tiles_to_check table
---@return boolean | number three_horizontally returns the player index of the winner if there's 3 horizontally, otherwise 0
local function check_horizontals(tiles_to_check)
    for i = 0, 2, 1 do
        local index_first_tile_horizontally = i * 3 + 1
        local to_check = tiles_to_check[index_first_tile_horizontally]
        if (tiles_to_check[index_first_tile_horizontally + 1] == to_check) and (tiles_to_check[index_first_tile_horizontally + 2] == to_check) then return emoji_to_player_index(to_check) end
    end

    return false
end

---@param tiles_to_check table
---@return boolean | number three_vertically returns the player index of the winner if there's 3 vertically, otherwise 0
local function check_verticals(tiles_to_check)
    for i = 1, 3, 1 do
        local index_first_tile_vertically = i
        local to_check = tiles_to_check[index_first_tile_vertically]
        if (tiles_to_check[index_first_tile_vertically + 3] == to_check) and (tiles_to_check[index_first_tile_vertically + 6] == to_check) then return emoji_to_player_index(to_check) end
    end

    return false
end

---@param tiles_to_check table
---@return boolean | number three_diagonally returns the player index of the winner if there's 3 diagonally, otherwise 0
local function check_diagonals(tiles_to_check)
    if tiles_to_check[5] == tiles_to_check[1] and tiles_to_check[9] == tiles_to_check[1] then return emoji_to_player_index(tiles_to_check[1]) end
    if tiles_to_check[5] == tiles_to_check[3] and tiles_to_check[7] == tiles_to_check[3] then return emoji_to_player_index(tiles_to_check[3]) end

    return false
end

---@param tiles_to_check table
---@return boolean draw returns true if there's a draw
local function check_for_draw(tiles_to_check)
    for i, t in ipairs(tiles_to_check) do
        if t ~= "❌" and t ~= "⭕" then return false end
    end

    return true
end


---@param tiles_to_check any
---@return string result "'continue' if nothing ends the game, 'draw' if a draw, 'winner player<index of player>' if there's a winner"
function check_tiles_for_end(tiles_to_check)
    if check_for_draw(tiles_to_check) then return "draw" end

    local horizontal_winner, vertical_winner, diagonal_winner = check_horizontals(tiles_to_check), check_verticals(tiles_to_check), check_diagonals(tiles_to_check)

    if horizontal_winner then return "winner player" .. horizontal_winner end
    if vertical_winner then return "winner player" .. vertical_winner end
    if diagonal_winner then return "winner player" .. diagonal_winner end

    return "continue"
end

----------------------------------------
----------------------------------------