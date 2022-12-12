---@param mention string
---@return table user The user from the userId
function user_mention_to_user(mention)
    -- "<@728656629800763433>" to "728656629800763433"
    mention = string.sub(mention, 3, #mention - 1)

    return client:getUser(mention)
end