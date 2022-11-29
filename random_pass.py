import random

password=""

def rand(case):
    if case==1: char=chr(random.randint(49,57))
    if case==2:
	char=chr(random.randint(65,90))
	if (ord(char)==73 or ord(char)==79): char=chr(ord(char)+1)
    if case==3:
	char=chr(random.randint(97,122))
	if (ord(char)==108 or ord(char)==111): char=chr(ord(char)+1)
    return char

for i in range(0,8,1):
    while len(password) !=8: password+=rand(random.randint(1,3))
    print(password)
    password=""