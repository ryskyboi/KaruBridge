#!/bin/bash

source .env

# Use this command to deploy to Base Testnet
forge script script/Bridging/TestnetBridging.s.sol \
  --rpc-url $BASE_TESTNET_RPC_URL \
  --private-key $PRIVATE_KEY \
  --broadcast \
  --verify \
  -vvv
