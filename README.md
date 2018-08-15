# docker-artiqox
Wallet and daemon for Artiqox [AIQ] cryptocurrency on docker

# Quickstart
Type `docker run -it -e "USER=me" -e "PASSWORD=secret" -e "RPCALLOW=127.0.0.1" chainmapper/artiqox` and see the wallet starting.

Alternatively type `docker run -it -v "<path_to_config>:/config/artiqox.conf" chainmapper/artiqox` to use your own config.

```
Docker AIQ wallet

By: ChainMapper
Website: https://chainmapper.com

Starting AIQ daemon...
```

# Proper start
Use a volume to store all data. The image stores it's data in `/data`. So mapping that volume will do the trick.

Additionally you can override the config and wallet file using volumes pointing to `/config/artiqox.conf` and `/config/wallet.data`

# License
MIT, see LICENSE file