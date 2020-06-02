#!/usr/bin/env python
#
# if/for/while then try with except(tion)
# function, class with self
# time, system, network
# time.time() time.sleep()
# os.getcwd() os.system()
#
# string with regexp
# lambda

# machine = 'hp'
# role = 'web'

class Host:
    def __init__(self, machine, role):
        self.machine = machine
        self.role = role

h1 = Host('hp', 'conn')
h2 = Host('hp', 'logos')
h3 = Host('hp', 'repo')

import re

line = "this is the line"
match = re.search('the', line)
print(match.group(0))

line = "this-is-the-line"
lt = line.split('-')
print(lt)

f = lambda a, b : a + b

print(f(1, 2))

{'E': [1,2]}
{'A': "lakjsdlf"}
