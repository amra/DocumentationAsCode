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
RUN apt-get install -y xz-utils
RUN apt-get install -y libssl1.0-dev    # https://github.com/amra/DocumentationAsCode/issues/2
ADD https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz /tmp/wkhtmltox.tar.xz
RUN cd /tmp && tar -xf /tmp/wkhtmltox.tar.xz wkhtmltox/bin/wkhtmltopdf
RUN mv /tmp/wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
RUN wkhtmltopdf -V
