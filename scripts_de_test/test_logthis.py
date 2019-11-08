#!/usr/bin/python

import os
from logs import logthis

os.chdir(os.path.dirname(os.path.realpath(__file__)))

logthis("ex04")
logthis("bonjour")
# ~/exam2/ex04 $ cat python.log
# cat python.log
# 2019-11-08 02:39:14 test
# 2019-11-08 02:39:19 salut
