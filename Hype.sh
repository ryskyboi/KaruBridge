#!/bin/bash

source .env

# Use this command to deploy to Base Testnet
forge script script/OnftDeploy.s.sol \
  --rpc-url $HYPE_TESTNET_RPC_URL \
  --private-key $PRIVATE_KEY \
  --broadcast \
  --verify \
  -vvv