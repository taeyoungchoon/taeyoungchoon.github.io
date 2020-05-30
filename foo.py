#!/usr/bin/env python
#
# if/for/while then try with except(tion)
# function, class with self
# time, system, network
# time.time() time.sleep()
# os.getcwd() os.system()
# string with regexp

import time, os

foo = 1
bar = "this is the world"
lt = [1, 2, 3]
kv = {1: 2, 3: 4}

if True:
    print(True)

if False:
    print(False)

if 0:
    print(False)

for item in lt:
    print(item)

for k, v in kv.items():
    print(k, '>', v)

print(int(time.time()))
time.sleep(0.5)
print(os.getcwd())

try:
    print('try')
except:
    print('except')
else:
    print('else')
finally:
    print('finally')

def hello():
    print("Hello, World")

hello()

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def show(self):
        print(self.x, self.y)

a = Point(10, 10)
a.show()
b = Point(100, 100)
b.show()
