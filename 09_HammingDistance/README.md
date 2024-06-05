# Hamming Distance Calculator

This Assembly MIPS code calculates the Hamming distance between two arrays of words (32-bit integers) and stores the results in a separate array. The Hamming distance is a metric for the number of bit positions at which two binary strings differ.

## Definition of "Hamming Distance"
In information theory, the Hamming distance between two strings or vectors of equal length is the number of positions at which the corresponding symbols are different. In other words, it measures the minimum number of substitutions required to change one string into the other, or equivalently, the minimum number of errors that could have transformed one string into the other (SRC: Wikipedia).

## Algorithm
1. XOR: For each corresponding element in the two arrays, the program performs a bitwise exclusive OR (XOR) operation. This operation results in a new value where only the bits that differ in the original elements are set to 1, and all matching bits are set to 0.
2. Isolating Differences: In order to count the number of differing bits (those set to 1) in the XOR result. To achieve this, the program performs a bitwise AND operation between the XOR result and 0b1 (binary notation). This operation isolates the rightmost differing bit in the XOR result (if any).
3. Accumulating Distance: The program adds the result of the AND operation (either 1 or 0) to a running total in the $t6 register. This essentially counts the number of differing bits encountered so far.
4. Shifting and Repeating: The program shifts the XOR result one bit to the right using a bitwise right shift operation. Steps 2 and 3 are then repeated on the shifted XOR result. This process continues until all bits in the XOR result have been processed.
5. Final Hamming Distance: The final accumulated value in the $t6 register represents the total Hamming distance between the two compared elements. This value gets saved into the result array.