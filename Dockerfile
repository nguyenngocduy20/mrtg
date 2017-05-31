FROM alpine

RUN ["apk", "add", "--update", "alpine-sdk"]
RUN ["apk", "add", "perl", "perl-dev", "perl-doc"]
RUN ["apk", "add", "musl"]
RUN ["apk", "add", "zlib", "zlib-dev"]
RUN ["apk", "add", "libpng", "libpng-dev", "libpng-doc"]
RUN ["apk", "add", "gd", "gd-dev"]

RUN mkdir -p /usr/local/src
WORKDIR "/usr/local/src/"
RUN ["wget", "http://oss.oetiker.ch/mrtg/pub/mrtg-2.17.4.tar.gz", "-O", "/usr/local/src/mrtg-2.17.4.tar.gz"]
WORKDIR "/usr/local/src/"
RUN gunzip -c /usr/local/src/mrtg-2.17.4.tar.gz | tar xvf -
RUN rm mrtg-2.17.4.tar.gz
WORKDIR "/usr/local/src/mrtg-2.17.4"
RUN ["./configure", "--prefix=/usr/local/mrtg-2"]
RUN ["make"]
RUN ["make", "install"]
