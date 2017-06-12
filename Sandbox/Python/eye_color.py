class BankAccount:
    def __init__(self, initial_balance = 0):
        self.balance = initial_balance
    def deposit(self, amount):
        self.balance = self.balance + amount
    def withdraw(self, amount):
        self.balance = self.balance - amount
    def overdrawn(self):
        return self.balance < 0

account_653 = BankAccount()
account_654 = BankAccount(200)
account_655 = BankAccount(350)
print(account_653.overdrawn())
