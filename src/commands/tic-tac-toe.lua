local TicTacToeGame = require('src.obj.tic_tac_toe_game')

local cmd = {}

cmd.name = "tic-tac-toe"
cmd.aliases = {
    "ttt"
}
cmd.description = "Plays a game of tic-tac-toe with you"

---@param message table
cmd.triggered = function(message)
    local message_as_command = message_to_command(message.content)

    if type(message_as_command) == "string" then error(message_as_command) return end

    -- Make sure the user specifies who they want to play against
    if message_as_command[2] == nil then message:reply("You need to mention the user you want to play against!") return end
    
    local user1 = message.author
    local user2 = user_mention_to_user(message_as_command[2])

    if is_player_in_game(user1) then message:reply("You are already in a game!") return end
    if is_player_in_game(user2) then message:reply("Your opponent is already in a game!") return end

    -- Make sure the user doesn't put themselves as their opponent
    if user1.id == user2.id then message:reply("You can't play a game with yourself!") return end

    local reply_instance = message.channel:send(tiles_to_message(tiles, "\n<@" .. user1.id .. ">'s Turn"))
    
    local game = TicTacToeGame(user1, user2, reply_instance)
    table.insert(tic_tac_toe_current_games, game)

    coroutine.wrap(function ()
        for i = 1, 9, 1 do
            coroutine.wrap(function ()
                reply_instance:addReaction(tiles[i])
            end)()
        end
    end)()
end

client:on('reactionAdd', function(reaction, userId)
    if client.user.id == userId then return end
    if #tic_tac_toe_current_games == 0 then return end

    local message = reaction.message

    -- Find the game 
    local game_reacted_to
    local user_index = 0
    for i, game in ipairs(tic_tac_toe_current_games) do
        local user_index_temp = game:is_user_in_game(userId)
        if game.message == message then
            if user_index_temp then
                game_reacted_to = game
                user_index = user_index_temp
                break
            end

            reaction:delete(userId)
            return
        end
    end

    -- Check if the reaction is a valid emoji and that it's the correct person's turn
    if not (table.find(game_reacted_to.tiles, reaction.emojiHash) ~= -1) or reaction.emojiHash == "❌" or reaction == "⭕" then reaction:delete(userId) return end
    if game_reacted_to.turn ~= user_index then print("Wrong player's turn") reaction:delete(userId) return end

    local number_of_tile = table.find(tiles, reaction.emojiHash)

    local new_tiles = game_reacted_to.tiles
    new_tiles[number_of_tile] = (user_index == 1) and "❌" or "⭕"
    game_reacted_to:update(new_tiles)

    reaction:delete(userId)
    reaction:delete()
end)

return cmd