#!/bin/bash

# wkhtmltopdf
docker run -w /foo -v `pwd`/test:/foo amra/documentation-as-code pandoc --self-contained --standalone --number-sections --table-of-contents --pdf-engine=wkhtmltopdf wkhtmltopdf.md -o wkhtmltopdf.pdf --template standalone.html
