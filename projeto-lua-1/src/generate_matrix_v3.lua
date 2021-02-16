function start()
  array1 = createArrayFromTxt("C:\\Users\\55119\\lua-workspace\\lua\\projeto-lua-1\\src\\Arquivo-1.inc")
  array2 = createArrayFromTxt("C:\\Users\\55119\\lua-workspace\\lua\\projeto-lua-1\\src\\Arquivo-2.inc")
  result = createResult(array1, array2)  
  readResult(result)
end

function createArrayFromTxt(filePath)

  newTxtPath = createAdjustedTxt(filePath)

  array = {}
  counter = 0
  
  local file,err = io.open(newTxtPath)
  if err then print(err); return; end
  
  -- read line by line
  while true do
    line = file:read()
    if line == nil then break end
    
    line = trim(line:gsub("  ", " ")) -- verificar a lógica para não precisar fazer isso
    
    -- split line by space
    for part in string.gmatch(line, "%S+") do
       counter = counter + 1
       array[counter] = tonumber(part)
    end
  end
  
  io.close(file)
  
  return array
end

function createAdjustedTxt(filePath)
  local file = io.open(filePath)

  newTxtPath = filePath:gsub(".inc", "_new.inc")
  newFile = io.open(newTxtPath, "w")
  io.output(newFile)
  
  while true do
    line = file:read()
    if line == nil then break end
    
    line = trim(line)
    
    -- split line by space
    for part in string.gmatch(line, "%S+") do
      if string.find(part, "*") then
        numbers = splitNumbers(part)
        io.write(numbers .. " ")
      else
        number = tonumber(part)
        io.write(number .. " ")
      end
    end
  end

  io.close(file)
  io.close(newFile)
  
  return newTxtPath
end

function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function splitNumbers(expression)
  parts = split(expression, "*")
  times = tonumber(parts[1])
  number = parts[2]
  numbers = ""
  for i=1,times do
    numbers = numbers .. " " .. number
  end
  return numbers
end

function split(text, delimiter)
    result = {};
    for match in (text..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function createResult(array1, array2)
  result = {}

  for i, number in ipairs(array1) do
    result[i] = (array1[i] + array2[i]) / 2 
  end

  return result
end

function readResult(result)
  for i, number in ipairs(result) do
    print(number)
  end
end

start()