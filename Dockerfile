FROM ubuntu:20.04
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends curl wget bzip2 ca-certificates && \
    apt-get install -y --no-install-recommends tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get install -y --no-install-recommends python3 python3-pip mysql-client git && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN python3 -m pip install --no-cache-dir GitPython==3.1.24 requests==2.26.0 pymysql==1.0.2
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends gnupg lsb-release && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update --fix-missing && \
    apt-get install docker-ce-cli && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
