a = (input("Please enter your first card: "))
b = (input("Plese enter your second card: "))

if ((a == "Ace" and b == "Jack") or (a == "Jack" and b == "Ace")):
    print("Blackjack!")
else:
   print("Sorry, looks like you're going to have a long night")

##a = input("Please enter your card: ")
##
##if (a != "Jack"):
##    print("You don't have a jack!")
##else:
##    print("You have a jack!")
