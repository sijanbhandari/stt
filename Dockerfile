FROM ubuntu:16.04

ENV LANG="C.UTF-8"

RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-security main restricted universe multiverse" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        python3 \
        libasound2-plugins \
        libsox-fmt-all \
        libsox-dev \
        ffmpeg \
        sox \
        wget \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

# setup natvie client
RUN tar xvfJ native_client.tar.xz
RUN cp lib* /usr/local/lib/
RUN cp deepspeech /usr/local/bin/
RUN cp generate_trie /usr/local/bin/
RUN ldconfig

# copy nnet 0.1 files
RUN ./dl.sh
RUN tar xvzf deepspeech-0.1.0-models.tar.gz

CMD ["./stt.py"]

