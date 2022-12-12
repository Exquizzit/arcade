local TicTacToeGame, get, set = class('TicTacToeGame')

---@param user1 table
---@param user2 table
---@param message table
function TicTacToeGame:__init(user1, user2, message)
    self._user1 = user1; self._user2 = user2
    self._message = message
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

return TicTacToeGame