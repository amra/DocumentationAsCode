FROM ubuntu:bionic

RUN apt-get update && apt-get install -y \
vim-tiny \
apt-transport-https \
curl \
wget \
less \
ack-grep \
apt-utils

RUN apt-get install -y texlive

# Pandoc 2.2
ADD https://github.com/jgm/pandoc/releases/download/2.2/pandoc-2.2-1-amd64.deb /tmp/pandoc.deb
RUN dpkg -i /tmp/pandoc.deb && rm -f /tmp/pandoc.deb
RUN pandoc -v

# wkhtmltopdf
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get install -y fontconfig xfonts-75dpi xfonts-base
ADD https://builds.wkhtmltopdf.org/0.12.5-dev/wkhtmltox_0.12.5-0.20180509.133.dev~a23cca3~bionic_amd64.deb /tmp/wkhtmltopdf.deb
RUN dpkg -i /tmp/wkhtmltopdf.deb || true
RUN wkhtmltopdf -V
