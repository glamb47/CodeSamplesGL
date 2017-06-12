num_balls = eval(input("Enter the number of balls you purchased: "))
if num_balls < 6:
    print("Each ball costs $30.00")
elif num_balls >= 12:
    print("Each ball costs $26.00")
else:
    print("Each ball costs $28.00")
