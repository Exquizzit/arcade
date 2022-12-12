local TicTacToeGame, get, set = class('TicTacToeGame')

---@param user1 table
---@param user2 table
---@param message table
function TicTacToeGame:__init(user1, user2, message)
    self._user1 = user1; self._user2 = user2
    self._message = message

    self._tiles = {
        "1️⃣", "2️⃣", "3️⃣",
        "4️⃣", "5️⃣", "6️⃣",
        "7️⃣", "8️⃣", "9️⃣"
    }
    self._turn = 1
end

---@param user table | string
---@return number | boolean user_index The index of the user if found, otherwise false
function TicTacToeGame:is_user_in_game(user)
    local userId = (type(user) == "string") and user or user.id

    if self._user1.id == userId then return 1 elseif self._user2.id == userId then return 2 end
    
    return false
end

function TicTacToeGame:update(new_tiles)
    self._turn = (self._turn == 1) and 2 or 1

    self._message:setContent(tiles_to_message(new_tiles, "\n<@" .. ((self._turn == 1) and self._user1.id or self._user2.id) .. ">'s Turn"))
end

function get.user1(self)
    return self._user1
end
function get.user2(self)
    return self._user2
end
function get.message(self)
    return self._message
end
function get.tiles(self)
    return self._tiles
end
function get.turn(self)
    return self._turn
end

function set.tiles(self, new_tiles)
    self._tiles = new_tiles
end

return TicTacToeGame