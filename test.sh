mkdir -p output
#!/bin/bash
mkdir -p /tmp/work
rm /tmp/work/* -rf

BASE=`pwd`

# html
echo "html *************************************************************"

docker run -w /foo \
   -v /tmp/work:/foo \
   -v $BASE/output:/foo/output \
   -v $BASE/test/html:/foo/input \
   -v $BASE/test/image:/foo/image \
   -v $BASE/template/pandoc-uikit/template.html:/root/.pandoc/templates/template.html \
   -v $BASE/template/pandoc-uikit/style.css:/foo/template.css \
   -v $BASE/template/pandoc-uikit/style.css:/templates/pandoc-uikit/style.css \
   -v $BASE/template/pandoc-uikit/scripts.js:/templates/pandoc-uikit/scripts.js \
   -v $BASE/template/pandoc-uikit/uikit.js:/templates/pandoc-uikit/uikit.js \
   -v $BASE/template/pandoc-uikit/jquery.sticky-kit.js:/bower_components/sticky-kit/jquery.sticky-kit.js \
   amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents input/html.md -o output/html_pandoc-uikit.html --template template --include-before-body input/html-intro.html

docker run -w /foo \
   -v /tmp/work:/foo \
   -v $BASE/output:/foo/output \
   -v $BASE/test/html:/foo/input \
   -v $BASE/test/image:/foo/image \
   -v $BASE/template/pandoc-bootstrap-adaptive-template/standalone.html:/root/.pandoc/templates/template.html \
   -v $BASE/template/pandoc-bootstrap-adaptive-template/template.css:/foo/template.css \
   -v $BASE/template/pandoc-bootstrap-adaptive-template/menu:/foo/menu \
   -v $BASE/template/pandoc-bootstrap-adaptive-template/script.js:/foo/script.js \
   -v $BASE/template/pandoc-bootstrap-adaptive-template/jquery.sticky-kit.js:/foo/jquery.sticky-kit.js \
   -v $BASE/template/pandoc-bootstrap-adaptive-template:/foo/pandoc-bootstrap-adaptive-template \
   amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents input/html.md -o output/html_pandoc-bootstrap-adaptive-template.html --template template --include-before-body input/html-intro.html


docker run -w /foo \
   -v /tmp/work:/foo \
   -v $BASE/output:/foo/output \
   -v $BASE/test/html:/foo/input \
   -v $BASE/test/image:/foo/image \
   -v $BASE/template/mindoc/dist/mindoc-pandoc.html:/root/.pandoc/templates/template.html \
   amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents input/html.md -o output/html_mindoc.html --template template --include-before-body input/html-intro.html


docker run -w /foo \
   -v /tmp/work:/foo \
   -v $BASE/output:/foo/output \
   -v $BASE/test/html:/foo/input \
   -v $BASE/test/image:/foo/image \
   -v $BASE/template/pandoc-bootstrap-template/template.html:/root/.pandoc/templates/template.html \
   -v $BASE/template/pandoc-bootstrap-template/template.css:/foo/template.css \
   amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents input/html.md -o output/html_pandoc-bootstrap-template.html --template template --css template.css --include-before-body input/html-intro.html


docker run -w /foo \
   -v /tmp/work:/foo \
   -v $BASE/output:/foo/output \
   -v $BASE/test/html:/foo/input \
   -v $BASE/test/image:/foo/image \
   -v $BASE/template/pandoc-goodies/templates/html5/github/GitHub.html5:/root/.pandoc/templates/template.html \
   amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents input/html.md -o output/html_pandoc-goodies.html --template template --include-before-body input/html-intro.html



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
