# cosmos-rpc-finder
[Tool for Cosmos & Tendermint based projects)](https://tendermint.com/)  
Our site: http://staketab.com/

## Description
This tool can be useful for:  
- Search for public RPC  
- Search for publicly available RPCs with an active stake  
*This configuration is not secure due to the possibility of DoS attacks

## Requirements
- Docker  

## Install
1. Download config file and change the parameters to suit you
```
curl -s https://raw.githubusercontent.com/c29r3/cosmos-rpc-finder/master/config.ini > config.ini; \
curl -s https://raw.githubusercontent.com/c29r3/cosmos-rpc-finder/master/rpc_urls.txt > rpc_urls.txt
```

2. Run docker container  
```
docker run -it --rm \
--volume $(pwd)/config.ini:/rpc-finder/config.ini \
--volume $(pwd)/rpc_urls.txt:/rpc-finder/rpc_urls.txt \
--name rpc-finder \
c29r3/cosmos-rpc-finder
```

#### Update docker image  
After running the command below, go to step 2  
```
docker rm -f rpc-finder; \
curl -s https://raw.githubusercontent.com/c29r3/cosmos-rpc-finder/master/config.ini > config.ini; \
docker pull rpc-finder
```