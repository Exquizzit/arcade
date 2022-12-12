local TicTacToeGame = require('src.obj.tic_tac_toe_game')

local cmd = {}

cmd.name = "tic-tac-toe"
cmd.aliases = {
    "ttt"
}
cmd.description = "Plays a game of tic-tac-toe with you"

cmd.current_games = {}

---@param message table
cmd.triggered = function(message)
    ---@type table | string
    local message_as_command = message_to_command(message.content)

    if type(message_as_command) == "string" then error(message_as_command) return end
    
    ---@type table
    local user2 = user_mention_to_user(message_as_command[2])
    local game = TicTacToeGame(message.author, user2, message)

    ---@type table
    local reply_instance = message.channel:send(":one: :two: :three: \n:four: :five: :six: \n:seven: :eight: :nine:")
end

client:on('reactionAdd', function(reaction, userId)
    ---@type table
    local message = reaction.message
end)

return cmd