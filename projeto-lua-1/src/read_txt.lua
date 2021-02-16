fh,err = io.open("C:\\Users\\55119\\lua-workspace\\lua\\projeto-lua-1\\src\\file1.txt")
if err then print(err); return; end

-- read line by line
while true do
  line = fh:read()
  if line == nil then break end
  print (line)
end