# Populate Core Data Example

This is an example Xcode project on how you can populate your Core Data database in your iOS or OS X application.

## The case

Sometimes you have a big amount of data that you want fill your Core Data database with data from (for example a webservice or an Excel file).

In order to do this I have setup a small example Xcode project. This project contains two targets:

- The iOS application target
- The Command Line Tool target

### Command Line Tool

The _Command Line Tool_ target is responsible for generating the database. This tool will generate the sqlite file an move it to the correct location so your it will be added to your iOS target.

### iOS

In the _Preloaded Database_ target the populated sqlite file will be copied to the correct location and prepares the Core Data setup with the help of MagicalRecord.

**MagicalRecord** is used because we want to reduce the amount of code.

## Setup

Here is how to setup your project with the Command Line Tool.

## LICENSE

Copyright (c) 2015 iCapps

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


