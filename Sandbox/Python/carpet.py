length = eval(input("Please enter the length of your room in feet: "))
width = eval(input("Please enter the width of your room in feet: "))
cost_per_yard = eval(input("Please, enter the cost per square yard of the carpet you will be using: "))
area = length * width
total_cost = area * cost_per_yard / 9
print("It will cost you", total_cost, "dollars to carpet your room.")
