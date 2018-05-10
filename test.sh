#!/bin/bash

# wkhtmltopdf
docker run -w /foo -v `pwd`:/foo amra/documentation-as-code pandoc --standalone --number-sections --pdf-engine=wkhtmltopdf test/wkhtmltopdf.md -o test/wkhtmltopdf.pdf
