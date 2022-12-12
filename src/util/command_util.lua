---@param message string The content of the message
---@return string | table command The parsed message where table[1] is the command name, string if error
function message_to_command(message)
    local message_components = {}

    if not message:character_at(1) == PREFIX then return "Not a valid command" end

    -- '!test a b c' -> 'test a b c'
    message = string.sub(message, 2, #message)

    repeat
        local i, j = string.find(message, " ")

        if not (i == nil) then
            table.insert(message_components, string.sub(message, 1, j-1))
            
            -- 'test a b c' -> 'a b c'
            message = string.sub(message, j+1, #message)
        else
            table.insert(message_components, message)
            break
        end
    until false

    return message_components
end