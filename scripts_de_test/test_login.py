#!/usr/bin/python3

from login import compare_pass
from sys import argv

if len(argv) > 1:
    if compare_pass(argv[1]):
        print("login ok")
    else:
        print("login failed")
