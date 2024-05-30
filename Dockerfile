FROM python:3.8.6

RUN apt-get update && \
    apt-get install -y git r-base

RUN pip install numpy scipy

RUN cd / && \
    git clone https://bitbucket.org/liulab/mageck.git && \
    mv mageck /app

WORKDIR /app

RUN python setup.py install
RUN mageck --version

ENTRYPOINT echo "Welcome to MAGeCK Docker" & mageck --version & /bin/bash 