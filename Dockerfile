FROM ubuntu:14.04

RUN apt-get update && apt-get -qy install wget gcc gzip unzip zlib1g-dev

WORKDIR /usr/local/bin
ADD http://m.m.i24.cc/osmconvert64 osmconvert
RUN chmod +x osmconvert
RUN wget -O - http://m.m.i24.cc/osmupdate.c | cc -x c - -o osmupdate
ADD http://motoroute.de/sites/default/files/MRTK_1.4.78.zip MRTK.zip
RUN unzip -p MRTK.zip > /usr/local/bin/mrtk && chmod +x /usr/local/bin/mrtk && rm MRTK.zip
ADD autoupdate /usr/local/bin/autoupdate

VOLUME /osm
WORKDIR /osm

CMD osmupdate
