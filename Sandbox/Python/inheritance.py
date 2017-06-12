class Pet:
    def __init__(self, name = "nothing"):
        self.name = name

class Dog(Pet):
    def bark(self):
        print("Ruff ruff")

class Cat(Pet):
    def meow(self):
        print("Meowww")

Cosmo = Dog("Cosmo")
Linda = Cat("Linda")

Cosmo.bark()
Linda.meow()
