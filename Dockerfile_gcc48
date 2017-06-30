FROM ubuntu:14.04

RUN apt-get update && apt-get -y install software-properties-common python-software-properties git

RUN git clone http://github.com/cmu-db/peloton

RUN /bin/bash -c "source ./peloton/script/installation/packages.sh"

RUN mkdir /peloton/build

RUN cd /peloton/build && cmake -DCMAKE_BUILD_TYPE=Release ..

RUN cd /peloton/build && make && make install

ENV PATH=$(BUILD_DIR)/bin:$PATH
ENV LD_LIBRARY_PATH=$(BUILD_DIR)/lib:$LD_LIBRARY_PATH

EXPOSE 15721

ENTRYPOINT ["./peloton/build/bin/peloton"]
