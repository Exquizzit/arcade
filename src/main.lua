_G.discordia = require('discordia')
require('src.headers')

local client = discordia.Client()

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
    if message.author.bot then return end

    if (message.content:character_at(1) ~= PREFIX) then return end

    local message_as_command = message_to_command(message.content)
    if type(message_as_command) == "table" then
        message.channel:broadcastTyping()
        return
    end
end)

client:run('Bot ' .. TOKEN)