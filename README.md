# Assembly x86-64 Programs

This repository contains several programs I implemented while learning assembly x86-64 using the AT&T syntax. Each program solves a different problem and demonstrates a specific concept. Even though the programs are quite simple, it took me a while to write them and debug them, but it was worth it! The programs are:

1. **Factorial:** The factorial program calculates the factorial of a given number using a recursive approach. It showcases the function call mechanism and the use of conditional branching.

2. **Fibonacci:** The fibonacci program generates the Fibonacci sequence up to a specified number of terms. It demonstrates recursion, but it lacks in error handling (maybe I come back to this..)

3. **Hello World:** No explanation needed, really.

4. **Increment:** The increment program prompts the user for a number, increments it by one using a separate function, and then print the result. It utilizes the printf and scanf functions for input/output operations and demonstrates function calls and stack manipulation in assembly. Stack manipulation was the most challenging part of this program, as I had to figure out how to pass arguments to functions and how to return values from functions without messing up.

5. **Power:** The power program calculates the result of raising a given number to a specified power. It uses recursion.

## Prerequisites

To run these programs, you need an x86-64 architecture machine with a compatible operating system. Additionally, you will require an assembler and linker, such as GNU Assembler (GAS) and GNU Linker (ld). I used online assembly compilers, as well as XCode on macOS.
