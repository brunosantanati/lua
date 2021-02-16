str = "This is some text containing the word tiger."
if string.find(str, "tiger") then
  print ("The word tiger was found.")
else
  print ("The word tiger was not found.")
end

str2 = "This is some text containing *."
if string.match(str2, "*") then
  print ("* was found.")
else
  print ("* was not found.")
end