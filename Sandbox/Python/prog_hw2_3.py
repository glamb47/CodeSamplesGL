num_hours = eval(input("Enter the number of hours you worked: "))
if num_hours > 40:
    overtime_hours = num_hours - 40
    overtime_pay = overtime_hours * 9
    print("You will be paid", overtime_pay + 200, "dollars")
else:
    normal_pay = num_hours * 5
    print("You will be paid", normal_pay, "dollars")
