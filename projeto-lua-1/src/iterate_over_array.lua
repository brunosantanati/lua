--[[names = {'John', 'Joe', 'Steve'}
for i = 1,3 do print( names[i] ) end

names = {'John', 'Joe', 'Steve'}
for i, name in ipairs(names) do
  print (name)
end

--  we need to count from 1 to the length of the table:
names = {'John', 'Joe'}
for nameCount = 1, #names do
  print (names[nameCount])
end]]

names = {'John', 'Joe', 'Steve'}
lastnames = {'Wesley', 'Smith', 'Lawson'}
for i, name in ipairs(names) do
  print (names[i] .. " " .. lastnames[i])
end