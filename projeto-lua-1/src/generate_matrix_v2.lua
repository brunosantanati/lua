function start()
  matrix1 = createMatrixFromTxt("C:\\Users\\55119\\lua-workspace\\lua\\projeto-lua-1\\src\\numeros1_v2.txt")
  matrix2 = createMatrixFromTxt("C:\\Users\\55119\\lua-workspace\\lua\\projeto-lua-1\\src\\numeros2_v2.txt")
  matrix3 = createMatrix3(matrix1, matrix2)  
  readMatrix(matrix3)
end

function createMatrixFromTxt(filePath)

  newTxtPath = createAdjustedTxt(filePath)

  matrix = {}
  lineCounter = 0
  columnCounter = 0
  
  fh,err = io.open(newTxtPath)
  if err then print(err); return; end
  
  -- read line by line
  while true do
    line = fh:read()
    if line == nil then break end
    
    line = trim(line:gsub("  ", " ")) -- verificar a lógica para não precisar fazer isso
    
    lineCounter = lineCounter + 1
    columnCounter = 0
    
    matrix[lineCounter] = {}
    
    -- split line by space
    for part in string.gmatch(line, "%S+") do
       number = tonumber(part)
       columnCounter = columnCounter + 1
       matrix[lineCounter][columnCounter] = number
    end
  end
  
  io.close(fh)
  
  return matrix
end

function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function createAdjustedTxt(filePath)
  file = io.open(filePath)

  newTxtPath = filePath:gsub(".txt", "_new.txt")
  newFile = io.open(newTxtPath, "w")
  io.output(newFile)
  
  while true do
    line = file:read()
    if line == nil then break end
    
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

function createMatrix3(matrix1, matrix2)
  matrix3 = {}
  for i=1,1 do -- deixar automatico quantidade de linhas
    matrix3[i] = {}
    for j=1,9 do -- deixar automatico quantidade de colunas
      matrix3[i][j] = (matrix1[i][j] + matrix2[i][j]) / 2 
    end
  end
  return matrix3
end

function readMatrix(matrix)
  for i=1,1 do -- deixar automatico quantidade de linhas
    for j=1,9 do -- deixar automatico quantidade de colunas
      print(matrix[i][j])
    end
    -- print("---")
  end
end

start()