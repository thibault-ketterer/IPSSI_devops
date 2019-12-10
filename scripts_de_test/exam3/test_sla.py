#!/usr/bin/python3

import unittest
from sla import show_sla
from math import floor


def fix_tree_space(s):
    return "\n".join([ x.rstrip() for x in s.split("\n")]).lower()


class TestUM(unittest.TestCase):
    def setUp(self):
        pass

    def test_sla99_9(self):
        self.assertEqual( fix_tree_space(show_sla(99.9).replace(".0", "")), "8h 45m 57s")

    def test_sla99_8(self):
        self.assertEqual( fix_tree_space(show_sla(99.8).replace(".0", "")), "17h 31m 55s")

    def test_sla99_5(self):
        self.assertEqual( fix_tree_space(show_sla(99.5).replace(".0", "")), "43h 49m 48s")  

if __name__ == '__main__':
    unittest.main()
