cents = eval(input("How many cents do you have?: "))
while cents < 0 or cents > 100:
    try:
        cents = eval(input("Please enter a number between 1-100: "))
    except ValueError:
        print("Please enter a positive integer.")
        
    
    
