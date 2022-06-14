#!/usr/bin/env python3

dictionary = { 'a': 'alpha',
               'b': 'beta',
               'c': 'charlie' }

def search(request):
    return dictionary[request]

value = search('b')
print(value)

