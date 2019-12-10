#!/usr/bin/python3

import unittest
from noel import show_noel
from math import floor

class TestUM(unittest.TestCase):
    def setUp(self):
        pass

    arg = ['', '2018-8-18']
    def test_noel20180818(self):
        self.assertEqual( show_noel(arg), "")

    arg = ['', '2020-11-1']
    def test_noel20201101(self):
        self.assertEqual( show_noel(arg), "")

if __name__ == '__main__':
    unittest.main()