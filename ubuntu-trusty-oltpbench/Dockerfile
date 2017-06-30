FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install python-dev software-properties-common python-software-properties git subversion ant

RUN add-apt-repository ppa:webupd8team/java

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

RUN apt-get update  && apt-get -y install oracle-java8-installer

RUN svn checkout https://github.com/cmu-db/peloton/trunk/script/oltpbenchmark/testbed

RUN git clone http://github.com/oltpbenchmark/oltpbench

RUN cd testbed && mv * ..

RUN cd oltpbench && ant

ENTRYPOINT ["python", "measure-performance-tpcc.py", "192.168.99.101", "15721"]

