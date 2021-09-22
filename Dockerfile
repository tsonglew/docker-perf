FROM ubuntu:18.04

COPY linux-4.14.173.tar.xz /
COPY main.py /

# install dependencies
RUN sed -i -E 's/(cn\.archive|security|archive)\.ubuntu\.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt update && apt install -y \
    wget \
    flex \
    bison \
    xz-utils \
    build-essential \
    python

# build perf
WORKDIR /
RUN tar -xf linux-4.14.173.tar.xz 
WORKDIR /linux-4.14.173/tools/perf/ 
RUN make -C . && make install
ENV PATH=$PATH:/linux-4.14.173/tools/perf/

WORKDIR /
CMD [ "bash" ]