# cosmos-rpc-finder
[Tool for Cosmos & Tendermint based projects](https://tendermint.com/)  
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
curl -s https://raw.githubusercontent.com/c29r3/cosmos-rpc-finder/master/config.yml > config.yml; \
curl -s https://raw.githubusercontent.com/c29r3/cosmos-rpc-finder/master/rpc_urls.txt > rpc_urls.txt; \
mkdir results && chmod 777 results
```

2. Fill in the configuration file `config.yml` and `rpc_urls.txt`  
The script needs at least 1 RPC service for normal operation. For example, your local node  
   `# rpc_urls.txt`  
   `http://localhost:26657`
```yaml
# true or false
verbose_mode: true

# Number of concurrent threads
threads_count: 50

# For the script to work properly, you must specify at least 1 public RPC
# Format: http://<ip>:<port> on each line
rpc_file_name: rpc_urls.txt

# The time during which the script will try to establish a connection
provider_timeout: 4

# Link to the file where the ip addresses of the nodes are located (optional)
genesis_file_url: http://localhost:26657/genesis
```



3. Run docker container  
```
docker run -it --rm \
-v $(pwd)/config.yml:/rpc-finder/config.yml \
-v $(pwd)/rpc_urls.txt:/rpc-finder/rpc_urls.txt \
-v $(pwd)/results:/rpc-finder/results \
--name rpc-finder \
c29r3/cosmos-rpc-finder
```

#### Update docker image  
After running the command below, go to step 2  
```
docker rm -f rpc-finder; \
curl -s https://raw.githubusercontent.com/c29r3/cosmos-rpc-finder/master/config.yml > config.yml; \
docker pull c29r3/cosmos-rpc-finder
```