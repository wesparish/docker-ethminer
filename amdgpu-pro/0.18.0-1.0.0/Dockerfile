FROM wesparish/amdgpu-pro-18.50-708488-ubuntu18.04

RUN apt-get update \
 && apt-get install -y \
  vim-tiny \
  python-pip \
  python-setuptools \
  flip \
        ca-certificates \
        iputils-ping \
        libssl-dev \
        libssl1.0.0 \
        curl \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /home/ethminer
RUN curl -Lso ethminer.tar.gz "https://github.com/ethereum-mining/ethminer/releases/download/v0.18.0/ethminer-0.18.0-cuda-9-linux-x86_64.tar.gz" && \
    tar -xzf ethminer.tar.gz && \
    rm -f claymore.tar.gz

COPY resources/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/*

RUN pip install wheel && \
    pip install elasticsearch-nvidia-metrics==1.0.7

# API port
EXPOSE 3333

ENV WALLET_ADDRESS="0x331077Cd09209dc9e51c2E44a711f928dE3F669e" \
    HOSTS="eth-us-east1.nanopool.org:9999 eth-us-west1.nanopool.org:9999" \
    OPTS="--tstart 50 --tstop 82"

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD [ "--HWMON", "1", \
      "--display-interval", "10", \
      "--exit", \
      "--nocolor", \
      "--stdout", \
      "--api-port", "3333" \
    ]
