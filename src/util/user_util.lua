---@param mention string
---@return string | table user The user from the userId
function user_mention_to_user(mention)
    -- "<@728656629800763433>" to "728656629800763433"
    if mention:character_at(1) ~= "<" or mention:character_at(#mention) ~= ">" then return "not a user mention" end
    mention = string.sub(mention, 3, #mention - 1)

    local user = client:getUser(mention)
    if user == nil then return "nil user" end
    return user
end


function user_to_mention(user)
    local user_type = type(user)
    if user_type== "table" then
        return "<@" .. tostring(user.id) .. ">"
    elseif user_type == "string" or user_type =="number" then
        return "<@" .. tostring(user) .. ">"
    end
end