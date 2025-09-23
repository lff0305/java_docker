FROM ubuntu:focal-20240530

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

ADD ./openjdk /opt/java/openjdk

RUN apt-get update && apt-get install -y telnet wget curl unzip sudo locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen en_US.UTF-8

RUN groupadd -g 1000 user && \
    useradd -u 1000 -g user user && \
    mkdir /logs && \
    chgrp user /logs && \
    chown user logs && \
    wget https://github.com/tianon/gosu/releases/download/1.18/gosu-amd64 && \
    # wget https://github.com/alibaba/arthas/releases/download/arthas-all-3.7.2/arthas-bin.zip && \
    chmod +x /gosu-amd64 && \
    mv /gosu-amd64 gosu && \
    mkdir arthas && \
    unzip arthas-bin.zip -d arthas && \
    rm -rf arthas-bin.zip

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"
