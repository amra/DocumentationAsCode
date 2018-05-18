#!/bin/bash
mkdir -p output

# wkhtmltopdf
echo "wkhtmltopdf *************************************************************"
docker run -w /foo -v `pwd`/test/output:/foo/output -v `pwd`/test/wkhtmltopdf:/foo -v `pwd`/test/image:/foo/image -v `pwd`/template:/foo/template amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents --pdf-engine=wkhtmltopdf wkhtmltopdf.md -o output/wkhtmltopdf.pdf --template template/pandoc-bootstrap-template.html --include-before-body wkhtmltopdf-intro.html

# WeasyPrint
echo -e "\n\n\n"
echo "weasyprint **************************************************************"
docker run -w /foo -v `pwd`/test/output:/foo/output -v `pwd`/test/weasyprint:/foo -v `pwd`/test/image:/foo/image -v `pwd`/template:/foo/template amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents --pdf-engine=weasyprint weasyprint.md -o output/weasyprint.pdf --template template/pandoc-bootstrap-template.html --include-before-body weasyprint-intro.html
