local cmd = {}

cmd.name = ""
cmd.aliases = {}
cmd.description = ""

---@param message table
cmd.triggered = function(message) end

return cmd