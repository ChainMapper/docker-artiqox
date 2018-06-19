# docker-artiqox
Wallet and daemon for Artiqox [AIQ] cryptocurrency on docker

# Quickstart
Type `docker run -it joshendriks/artiqox` and see the wallet starting.

```
Docker artiqox wallet

By: Jos Hendriks
GitHub: https://github.com/joshendriks/
Docker: https://hub.docker.com/r/joshendriks/

BTC: 1NCZgpMMoNwL6ZeFsEQ2kRZEzzzTd5TuGk
AIQ: AN1gXBtaAVnt16DJDBHVG35hqFPcZURPyo

Starting AIQ daemon...
```

# Proper start
Use a volume to store all data. The image stores it's data in `/data`. So mapping that volume will do the trick.

Additionally you can override the config and wallet file using volumes pointing to `/config/artiqox.conf` and `/config/wallet.data`

# Donations:
BTC: 1NCZgpMMoNwL6ZeFsEQ2kRZEzzzTd5TuGk

AIQ: AN1gXBtaAVnt16DJDBHVG35hqFPcZURPyo

# License
MIT, see LICENSE file