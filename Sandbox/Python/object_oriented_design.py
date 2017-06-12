class People:
    eyes = "blue"
    age = "22"
    def say_hey(self):
        return "Hey"

Sam = People()
print(Sam.eyes)
Sam.eyes = "brown"
print(Sam.eyes)
print(Sam.say_hey())


