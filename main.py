import os

def headers():
    with open("data.txt", "w") as title:
        title.write(f'FirsName, LastName, Age\n')
        title.close()

def create():
    with open("data.txt", "x") as create:
        create.close()
def include():
    fname = input("First name: ")
    lname = input("Last name: ")
    age = input("Age: ")

    with open("data.txt","a") as add:
        add.write(f'{fname}, {lname}, {age}\n')

if os.path.exists("data.txt"):
    include()
    print("file updated")
else:
    create()
    headers()
    include()
    print("file created and updated")