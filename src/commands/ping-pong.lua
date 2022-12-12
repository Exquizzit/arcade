local cmd = {}

cmd.name = "ping"
cmd.aliases = {
    "p",
}
cmd.description = "Replies with 'Pong'"

---@param message table
cmd.triggered = function(message)
    message:reply {
        content = "Pong!",
        mention = message.author,
    }
end

return cmd