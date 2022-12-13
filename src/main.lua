_G.discordia = require('discordia')
_G.client = discordia.Client()
require('./headers')

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
    if message.author.bot then return end

    if (message.content:character_at(1) ~= PREFIX) then return end

    ---@type table|string
    local message_as_command = message_to_command(message.content)
    if type(message_as_command) == "table" then
        ---@cast message_as_command table
        execute_command(message_as_command, message.author, message)
    else
        ---@cast message_as_command string
        warn(message_as_command)
    end
end)

client:run('Bot ' .. TOKEN)