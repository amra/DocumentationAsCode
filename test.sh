mkdir -p output
#!/bin/bash
mkdir -p /tmp/work
rm /tmp/work/* -rf

BASE=`pwd`

# html
echo "html *************************************************************"

docker run -w /foo \
   -v /tmp/work:/foo \
   -v $BASE/test/output:/foo/output \
   -v $BASE/test/html:/foo/input \
   -v $BASE/test/image:/foo/image \
   -v $BASE/template/pandoc-bootstrap-adaptive-template/standalone.html:/root/.pandoc/templates/template.html \
   -v $BASE/template/pandoc-bootstrap-adaptive-template/template.css:/foo/template.css \
   -v $BASE/template/pandoc-bootstrap-adaptive-template/menu:/foo/menu \
   -v $BASE/template/pandoc-bootstrap-adaptive-template/script.js:/foo/script.js \
   -v $BASE/template/pandoc-bootstrap-adaptive-template/jquery.sticky-kit.js:/foo/jquery.sticky-kit.js \
   -v $BASE/template/pandoc-bootstrap-adaptive-template:/foo/pandoc-bootstrap-adaptive-template \
   amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents input/html.md -o output/html.html --template template --include-before-body input/html-intro.html

exit

# wkhtmltopdf
echo "wkhtmltopdf *************************************************************"
docker run -w /foo -v $BASE/test/output:/foo/output -v $BASE/test/wkhtmltopdf:/foo/input -v $BASE/test/image:/foo/image -v $BASE/template:/foo/template amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents --pdf-engine=wkhtmltopdf input/wkhtmltopdf.md -o output/wkhtmltopdf.pdf --template template/pandoc-bootstrap-template.html --include-before-body input/wkhtmltopdf-intro.html

# WeasyPrint
echo -e "\n\n\n"
echo "weasyprint **************************************************************"
docker run -w /foo -v $BASE/test/output:/foo/output -v $BASE/test/weasyprint:/foo/input -v $BASE/test/image:/foo/image -v $BASE/template:/foo/template amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents --pdf-engine=weasyprint input/weasyprint.md -o output/weasyprint.pdf --template template/pandoc-bootstrap-template.html --include-before-body input/weasyprint-intro.html
