file = open('my_lower.txt', 'r+') # open my_lower.txt in read and write mode
lowercase = file.read() # read my_lower.txt and save it to the variable lowercase
z = lowercase.upper() # convert my_lower.txt lowercase letters to all uppercase letters and save it to variable z
file = open('my_upper.txt', 'w') # open a file called my_upper.txt in write mode
file.write(z) # take the all uppercase characters saved to variable z and write it into the file my_upper.txt
file.close() # close my_upper.txt file
