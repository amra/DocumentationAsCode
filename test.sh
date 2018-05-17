#!/bin/bash

# wkhtmltopdf
docker run -w /foo -v `pwd`/test:/foo -v `pwd`/template:/foo/template amra/documentation-as-code pandoc --self-contained --standalone --number-sections --table-of-contents --pdf-engine=wkhtmltopdf wkhtmltopdf.md -o wkhtmltopdf.pdf --template template/pandoc-bootstrap-template.html --include-before-body wkhtmltopdf-intro.html

# WeasyPrint
docker run -w /foo -v `pwd`/test:/foo -v `pwd`/template:/foo/template amra/documentation-as-code pandoc --self-contained --standalone --number-sections --table-of-contents --pdf-engine=weasyprint weasyprint.md -o weasyprint.pdf --template template/pandoc-bootstrap-template.html --include-before-body weasyprint-intro.html
