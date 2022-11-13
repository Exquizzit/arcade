-- Extension method for getting the character at a certain index of a string
string.character_at = function (str, index)
    return string.sub(str, index, index)
end