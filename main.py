class Calculator:
    def __init__(self):
        try:
            self.num1 = int(input("first number: "))
            self.num2 = int(input("second number: "))
            self.symbol = input("math symbol: ")
        except ValueError:
            print("only numbers plese")

    def addition(self):
        print(f'Result: {self.num1 + self.num2}')
    def subtraction(self):
        print(f'Result: {self.num1 - self.num2}')
    def multiplication(self):
        print(f'Result: {self.num1 * self.num2}')
    def division(self):
        try:
            print(f'Result: {self.num1 / self.num2}')
        except ZeroDivisionError:
            print("Numbers cannot be divided by zero") 


calculator = Calculator()
calculator.addition()