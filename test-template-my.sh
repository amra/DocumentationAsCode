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
   -v $BASE/template/github-markdown.html:/root/.pandoc/templates/github-markdown.html \
   amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents input/html.md -o output/html_github-markdown.html --template github-markdown --include-before-body input/html-intro.html

docker run -w /foo \
   -v /tmp/work:/foo \
   -v $BASE/output:/foo/output \
   -v $BASE/test/html:/foo/input \
   -v $BASE/test/image:/foo/image \
   -v $BASE/template/twitter-bootstrap.html:/root/.pandoc/templates/twitter-bootstrap.html \
   amra/documentation-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents input/html.md -o output/html_twitter-bootstrap.html --template twitter-bootstrap --include-before-body input/html-intro.html
