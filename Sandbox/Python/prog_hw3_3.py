# Garret Lamb
cents = eval(input("Please enter the amount of change you have. The amount must be between 0 and 99 : "))
quarters = 0
dimes = 0
nickels = 0
pennies = 0
while cents > 0:
    if cents >= 25:
        cents = cents - 25
        quarters = quarters + 1
    elif cents >= 10:
        cents = cents - 10
        dimes = dimes + 1
    elif cents >= 5:
        cents = cents - 5
        nickels = nickels + 1
    elif cents >= 1:
        cents = cents - 1
        pennies = pennies + 1
print("The least amount of coins I can give you are", quarters, "quarters,", dimes, "dimes,", nickels, "nickels, and", pennies, "pennies.")
    
