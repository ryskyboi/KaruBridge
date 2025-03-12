#!/bin/bash

source .env

# Use this command to deploy to Base Testnet
forge script script/PeerSetters/SetPeerArb.s.sol \
    --rpc-url $ARB_TESTNET_RPC_URL \
    --private-key $PRIVATE_KEY \
    --broadcast \
    --verify \
    --etherscan-api-key $ARBISCAN_API_KEY \
    -vvv