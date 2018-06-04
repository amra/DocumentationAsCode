#!/bin/bash
if [ -d "pandoc-bootstrap-template" ]; then
    cd pandoc-bootstrap-template
    git pull
    cd ..
else
    git clone https://github.com/tonyblundell/pandoc-bootstrap-template
fi

if [ -d "pandoc-bootstrap-adaptive-template" ]; then
    cd pandoc-bootstrap-adaptive-template
    git pull
    cd ..
else
    git clone https://github.com/diversen/pandoc-bootstrap-adaptive-template.git
fi

if [ -d "pandoc-uikit" ]; then
    cd pandoc-uikit
    git pull
    cd ..
else
    git clone https://github.com/diversen/pandoc-uikit.git
fi

if [ -d "mindoc" ]; then
    cd mindoc
    git pull
    cd ..
else
    git clone https://github.com/bitfragment/mindoc.git
fi

if [ -d "gh-themes-magick" ]; then
    cd gh-themes-magick
    git pull
    cd ..
else
    git clone https://github.com/tajmone/gh-themes-magick.git
fi

if [ -d "pandoc-goodies" ]; then
    cd pandoc-goodies
    git pull
    cd ..
else
    git clone https://github.com/tajmone/pandoc-goodies.git
fi
