FROM chainmapper/walletbase-xenial-build as builder

RUN apt-get -y update \
	&& apt-get -y install libdb++-dev

ENV GIT_COIN_URL    https://github.com/artiqox/artiqox.git
ENV GIT_COIN_NAME   artiqox   

RUN	git clone $GIT_COIN_URL $GIT_COIN_NAME \
	&& cd $GIT_COIN_NAME \
	&& git checkout tags/v1.1.2.0 \
	&& chmod +x autogen.sh \
	&& chmod +x share/genbuild.sh \
	&& chmod +x src/leveldb/build_detect_platform \
	&& ./autogen.sh && ./configure --with-incompatible-bdb \
	&& make \
	&& make install

FROM chainmapper/walletbase-xenial as runtime

COPY --from=builder /usr/local/bin /usr/local/bin
RUN mkdir /data
ENV HOME /data

#zmq port, rpc port & main port
EXPOSE 5555 6666 19427

COPY start.sh /start.sh
COPY gen_config.sh /gen_config.sh
COPY wallet.sh /wallet.sh
RUN chmod +x /*.sh
CMD /start.sh artiqox.conf AIQ artiqoxd