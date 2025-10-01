# Flex Scanner Project

## Purpose
This project is a lexical analyzer built with **Flex**.  
It scans a source code file, identifies tokens such as identifiers, numbers, operators, and delimiters, and outputs them in two columns  

---

## Requirements
- Flex
- GCC
- A test input file (Ex: `input_sourcecode`)

---

## How to Compile and Run

1. **Generate the scanner code using Flex**
   ```bash
   flex ScannerCode.l
2. **Compile generated code with gcc** 
    ```bash
    gcc lex.yy.c -o scanner
3. **Run the scanner with input source file**
    ```bash 
    ./scanner < input_sourcecode.txt > output.txt
- output.txt -> will list the tokens
---