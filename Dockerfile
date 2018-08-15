FROM chainmapper/walletbase-bionic
	
ENV WALLET_URL=https://github.com/artiqox/artiqox/releases/download/v1.1.2.0/artiqox-1.1.2-linux64.zip

RUN wget $WALLET_URL -O /tmp/wallet.zip \
	&& unzip -j /tmp/wallet.zip -d /usr/local/bin \
	&& chmod +x /usr/local/bin/*

#rpc port & main port
EXPOSE 6666 19427

RUN mkdir /data
ENV HOME /data

COPY start.sh /start.sh
COPY gen_config.sh /gen_config.sh
RUN chmod +x /*.sh
CMD /start.sh artiqox.conf AIQ artiqoxd