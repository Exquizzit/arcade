local all_commands = {}

-- Read in all files
for i, filename in ipairs(scandir("src/commands")) do
    if filename ~= "base-command.lua" then
        local j, k = string.find(filename, ".lua")
        local actual_name = string.sub(filename, 1, j - 1)
        table.insert(all_commands, require('./../commands/' .. actual_name))
    end
end

---@param command_args table
---@param sender table
---@param message table
function execute_command(command_args, sender, message)
    ---@type string
    local command_name = command_args[1]
    table.remove(command_args, 1)

    ---@type table | boolean
    local cmd = get_command_by_name_or_alias(command_name)

    if cmd then
        ---@cast cmd table
        cmd.triggered(message)
    end

    
end

---@param command_name string
---@return table | boolean Command The command found by name, false if none found
function get_command_by_name_or_alias(command_name)
    for i, cmd in ipairs(all_commands) do
        if command_name == cmd.name or ((table.find)(cmd.aliases, command_name) ~= -1) then
            return cmd
        end
    end

    return false
end