function start()
  matrix1 = createMatrixFromTxt("C:\\Users\\55119\\lua-workspace\\lua\\projeto-lua-1\\src\\numeros1.txt")
  matrix2 = createMatrixFromTxt("C:\\Users\\55119\\lua-workspace\\lua\\projeto-lua-1\\src\\numeros2.txt")
  matrix3 = createMatrix3(matrix1, matrix2)  
  readMatrix(matrix3)
end

function createMatrixFromTxt(filePath)
  matrix = {}
  lineCounter = 0
  columnCounter = 0
  
  fh,err = io.open(filePath)
  if err then print(err); return; end
  
  -- read line by line
  while true do
    line = fh:read()
    if line == nil then break end
    
    lineCounter = lineCounter + 1
    columnCounter = 0
    
    matrix[lineCounter] = {}
    
    -- split line by space
    for i in string.gmatch(line, "%S+") do
       number = tonumber(i)
       columnCounter = columnCounter + 1
       matrix[lineCounter][columnCounter] = number
    end
  end
  
  return matrix
end

function createMatrix3(matrix1, matrix2)
  matrix3 = {}
  for i=1,3 do
    matrix3[i] = {}
    for j=1,4 do
      matrix3[i][j] = matrix1[i][j] * matrix2[i][j] 
    end
  end
  return matrix3
end

function readMatrix(matrix)
  for i=1,3 do
    for j=1,4 do
      print(matrix[i][j])
    end
    print("---")
  end
end

start()