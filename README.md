# ft_printf

## Overview
This project is an implementation of the printf function in C, named ft_printf. The 
purpose of this project is to deepen understanding of variadic functions and the 
mechanics behind formatting strings in C.

## Learning Goals

- Understand variadic functions in C.
- Gain insight into string formatting and manipulation.
- Implement a simplified version of the printf function.

For more check the [subject](subject.pdf)

## Getting Started
To compile the ft_printf library, you can use the provided Makefile. Simply navigate to the project directory and run:

    make

This will generate the libftprintf.a static library file.

## Usage

To use ft_printf in your own C projects, follow these steps:
Include the header file:

    #include "libftprintf.h"

Compile your program with libftprintf.a:

    gcc your_program.c libftprintf.a  lib/libft/libft.a -o output_executable

Run your program:

    ./your_program

## Example

Here's a simple example demonstrating the usage of ft_printf:
    #include "libftprintf.h"

    int main() {
        ft_printf("Hello, %s!\n", "world");
        return 0;
    }

Compile the above program using the provided instructions and execute it to see the output.

## Contributing
Contributions are welcome! Feel free to submit bug reports, feature requests, or pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
