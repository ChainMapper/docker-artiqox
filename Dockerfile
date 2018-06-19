FROM ubuntu:artful

RUN apt-get update \
    && apt-get -y upgrade \
	&& apt-get -y install libboost-system1.62.0 libboost-filesystem1.62.0 libboost-program-options1.62.0 \
	libboost-thread1.62.0 libboost-chrono1.62.0 libdb4.8 libdb4.8++ libdb5.3 libdb5.3++ libssl1.0.0 unzip \
	libevent-2.1-6 libevent-pthreads-2.1-6 software-properties-common \
    && add-apt-repository ppa:bitcoin/bitcoin \
    && apt-get update \
    && apt-get -y install libdb4.8-dev libdb4.8++-dev unzip \
    && apt-get -y install wget libzmq5 libminiupnpc10
	
ENV WALLET_URL=https://github.com/artiqox/artiqox/releases/download/v1.1.2.0/artiqox-1.1.2-linux64.zip

RUN wget $WALLET_URL -O /tmp/wallet.zip \
	&& unzip -j /tmp/wallet.zip -d /usr/local/bin \
	&& mkdir -p /data/.artiqox

COPY artiqox.conf /data/.artiqox/artiqox.conf
	
#rpc port & main port
EXPOSE 19421 19427

ENV HOME /data

COPY start.sh /start.sh
RUN chmod 777 /start.sh
CMD /start.sh
