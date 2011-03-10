#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# ### This module uses Python 3.1
#
#       problem2.py -- http://projecteuler.net/index.php?section=problems&id=2
#       
#       Copyright 2010 Colby Williams (Yorokobi)
#       [colbyw - at - gmail - dot - com]
#       
#       The MIT License: http://www.opensource.org/licenses/mit-license.html
#       
#       Permission is hereby granted, free of charge, to any person obtaining a copy
#       of this software and associated documentation files (the "Software"), to deal
#       in the Software without restriction, including without limitation the rights
#       to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#       copies of the Software, and to permit persons to whom the Software is
#       furnished to do so, subject to the following conditions:
#       
#       The above copyright notice and this permission notice shall be included in
#       all copies or substantial portions of the Software.
#       
#       THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#       IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#       FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#       AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#       LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#       OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#       THE SOFTWARE.
#
# Find the sum of all the even-valued terms in the sequence which do not exceed four million.
#       
# Each new term in the Fibonacci sequence is generated by adding the previous two terms. 
# By starting with 1 and 2, the first 10 terms will be:
#
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

a, b, c = 0, 1, 0
while a < 4000000:
    a, b = b, a+b
    if a % 2 == 0:
        c = a + c

print(c)
