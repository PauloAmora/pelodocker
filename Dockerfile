FROM ubuntu:14.04

RUN apt-get update && apt-get -y install python-dev software-properties-common python-software-properties git java

RUN apt-add-repository ppa:webupd8team/java && apt-get update && apt-get install oracle-java8-installer

RUN git clone http://github.com/cmu-db/peloton

RUN git clone http://github.com/oltpbenchmark/oltpbench

RUN export JAVA_HOME=/usr/lib/jvm/java-8-oracle

RUN /bin/bash -c "source ./peloton/script/installation/packages.sh"

RUN mkdir /peloton/build

RUN cd /peloton/build && cmake -DCMAKE_BUILD_TYPE=Release -DCOVERALL=False ..

RUN cd /peloton/build && make check && make install

ENV PATH=$(BUILD_DIR)/bin:$PATH
ENV LD_LIBRARY_PATH=$(BUILD_DIR)/lib:$LD_LIBRARY_PATH

EXPOSE 15721

ENTRYPOINT ["./peloton/build/bin/peloton"]