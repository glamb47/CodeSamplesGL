k_hr = eval(input("Enter the number of kilowatt-hours you consumed: "))
if k_hr <= 300:
    print("Your bill is $ 5.00")
elif 301 <= k_hr <= 1000:
    mid_bill = (k_hr - 300) * .03 + 5
    print("Your bill is $",mid_bill)
elif k_hr >= 1001:
    high_bill = (k_hr - 1000) * .02 + 36
    print("Your bill is $",high_bill)
else:
    print("Please enter a whole number.")
