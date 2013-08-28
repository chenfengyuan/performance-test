#!/usr/bin/env python
from __future__ import generators

def fn():
    arr = []
    for i in xrange(0,100000000):
        arr.append(i)
    while True:
        yield

def main():
    c1 = fn()
    c2 = fn()
    total = 50000000
    for i in xrange(0,total):
        c1.next()
        c2.next()
if __name__ == '__main__':
    main()