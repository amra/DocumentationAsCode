#!/bin/bash
mkdir -p output

BASE=`pwd`

# wkhtmltopdf
echo "wkhtmltopdf *************************************************************"
docker run -w /foo -v $BASE/test/output:/foo/output -v $BASE/test/wkhtmltopdf:/foo/input -v $BASE/test/image:/foo/image -v $BASE/template:/foo/template amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents --pdf-engine=wkhtmltopdf input/wkhtmltopdf.md -o output/wkhtmltopdf.pdf --template template/pandoc-bootstrap-template.html --include-before-body input/wkhtmltopdf-intro.html

# WeasyPrint
echo -e "\n\n\n"
echo "weasyprint **************************************************************"
docker run -w /foo -v $BASE/test/output:/foo/output -v $BASE/test/weasyprint:/foo/input -v $BASE/test/image:/foo/image -v $BASE/template:/foo/template amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents --pdf-engine=weasyprint input/weasyprint.md -o output/weasyprint.pdf --template template/pandoc-bootstrap-template.html --include-before-body input/weasyprint-intro.html
