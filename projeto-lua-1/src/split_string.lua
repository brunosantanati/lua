local example = "an example string"
for i in string.gmatch(example, "%S+") do
   print(i)
end

local numbers = "10.50 20.50 30.50"
for i in string.gmatch(numbers, "%S+") do
   num = tonumber(i)
   num2 = num * 2
   print(num2)
end