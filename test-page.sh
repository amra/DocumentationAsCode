#!/bin/bash
mkdir -p output
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
   -v $BASE/template/pandoc-goodies/templates/html5/github/GitHub.html5:/root/.pandoc/templates/template.html \
   marekhudik/document-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents input/html-landscape.md -o output/html_pandoc-goodies-print.html --template template --include-before-body input/html-intro-page-break.html
