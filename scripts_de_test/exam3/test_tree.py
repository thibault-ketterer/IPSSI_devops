#!/usr/bin/python3

import unittest
from tree import show_tree
from math import floor

def fix_tree_space(s):
    return "\n".join([ x.rstrip() for x in s.split("\n")]).lower().rstrip()

class TestUM(unittest.TestCase):
    def setUp(self):
        pass

    def test_tree1(self):
        self.assertEqual( show_tree(1), "x\nx")

    def test_tree2(self):
        self.assertEqual( fix_tree_space(show_tree(2)), 
                " x\nxxx\n x")
        
    def test_tree5(self):
        # self.assertEqual( show_tree(5), "  x  \n xxx \nxxxxx\n xxx \n xxx ")
        self.assertEqual( fix_tree_space(show_tree(5)), (
                "  x\n"
                " xxx\n" 
                "xxxxx\n"
                " xxx\n"
                " xxx")
                )

    def test_tree30(self):
        self.assertEqual( fix_tree_space(show_tree(30)), """               x
              xxx
             xxxxx
            xxxxxxx
           xxxxxxxxx
          xxxxxxxxxxx
         xxxxxxxxxxxxx
        xxxxxxxxxxxxxxx
       xxxxxxxxxxxxxxxxx
      xxxxxxxxxxxxxxxxxxx
     xxxxxxxxxxxxxxxxxxxxx
    xxxxxxxxxxxxxxxxxxxxxxx
   xxxxxxxxxxxxxxxxxxxxxxxxx
  xxxxxxxxxxxxxxxxxxxxxxxxxxx
 xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
              xxx
              xxx
              xxx
              xxx
              xxx
              xxx
              xxx""")  

if __name__ == '__main__':
    unittest.main()
