#!/bin/bash

# wkhtmltopdf
docker run -w /foo -v `pwd`/test:/foo amra/documentation-as-code pandoc --standalone --number-sections --pdf-engine=wkhtmltopdf wkhtmltopdf.md -o wkhtmltopdf.pdf
