function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

split_string = split("Hello World!", " ")
print(split_string[1])
print(split_string[2])

split_string2 = split("my*cool*phrase", "*")
print(split_string2[1])
print(split_string2[2])
print(split_string2[3])