# README

## About

vim-symbols-strings is a plugin that converts Ruby symbols to strings and vice versa. It can be used in conjunction with vim operator commands.

## Usage

For now, the commands are frozen as follows:

* <Leader>g<movement modifiers> to convert symbols to strings - e.g. <Leader>gi( will convert all symbols inside parenthesis to strings
* <Leader>l<movement modifiers> to convert strings to symbols - e.g. <Leader>li( will convert all symbols inside parenthesis to strings

## Caveat Emptor

The definition of what constitutes a string or a symbol is fairly naive - I tend to use largely letters and underscores in symbols and so the regexps will only recognise those for conversion - am hoping that this covers most fo the use cases

## Installation

The easiest way to install this would be to use Pathogen and include the git repo as a git submodule in your bundle.

## License

symbols-strings is licensed under the MIT license

Copyright (C) 2011 by Rory McKinley

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

