# 3x3 Matrix Determinant Calculation in MIPS Assembly

This repository contains a MIPS assembly program designed to calculate the determinant of a 3x3 matrix. The goal is to compute the determinant using a subroutine for the 2x2 determinant.

## Overview

The program reads a 3x3 matrix from memory, calculates its determinant using the formula for the determinant of a 3x3 matrix:
det(A) = a*(e*i - f*h) - b*(d*i - f*g) + c*(d*h - e*g)
where a, b, c, d, e, f, g, h, i are the elements of the matrix. The calculation is performed by breaking it down into several 2x2 determinant calculations.