# Lucee wrapper for Apache Tika

This wrapper component allows functionality from the Apache Tika java library to be used easily within Lucee without conflicting with the Tika version used by Lucee itself.

## Installation

Simply copy the contents of the repo to a location where `wrapper.cfc` can be called by your application.

## Usage

The following example assumes the file containing the script is in the same directory as the folder containing the repo files, i.e.:

- root/
  - lucee-tika/
    - wrapper.cfc
    - etc.
  - script.cfm
  - test.pdf
 
```
<cfscript>
pdfPath = ExpandPath( "test.pdf" )
tika = New lucee-tika.wrapper()
extractedText = tika.parseToString( pdfPath )
</cfscript>
```

## Test Suite
The automated tests require [TestBox 2.1](https://github.com/Ortus-Solutions/TestBox) or later. You will need to create an application mapping for `/testbox`

## Legal

### The MIT License (MIT)

Copyright (c) 2022 Julian Halliwell

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.