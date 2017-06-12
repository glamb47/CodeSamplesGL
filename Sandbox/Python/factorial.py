def Factorial(n):
    if(n == 0):
        return 1
    else:
        return (n * Factorial(n-1))

number = eval(input("Please enter a number: "))
print(Factorial(number))
