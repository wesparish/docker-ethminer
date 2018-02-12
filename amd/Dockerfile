FROM wesparish/amd:16.04-17.10

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && apt-get install -yqq --no-install-recommends \
	vim-tiny \
	flip \
	libcurl3 \
        curl \
        ca-certificates \
 && apt-get -yqq clean \
 && rm -rf /var/lib/apt/lists/*

ENV ETHMINER_VERSION="0.13.0"

WORKDIR /home/ethminer
RUN curl -Lso ethminer.tar.gz https://github.com/ethereum-mining/ethminer/releases/download/v${ETHMINER_VERSION}/ethminer-${ETHMINER_VERSION}-Linux.tar.gz && \
    tar -xzf ethminer.tar.gz && \
    rm -f ethminer.tar.gz

COPY resources/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/*

ENV WALLET_ADDRESS="0x559db2865e1f099d63037c3ae4a6c8cc1106c819" \
    HOSTS="eth-us-west1.nanopool.org:9999 eth-us-east1.nanopool.org:9999"

LABEL miner="true"

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
