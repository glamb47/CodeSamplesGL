milage_last_fillup = eval(input("Enter the milage of your car at the last fill up: "))
milage_this_fillup = eval(input("Enter the milage of your car at this fill up: "))
num_gals = eval(input("Enter the number of gallons you pumped to fill your tank: "))
miles = milage_this_fillup - milage_last_fillup
mpg = miles/num_gals
print("According to my calculations, your car gets an average of", mpg, "miles per gallon.")
