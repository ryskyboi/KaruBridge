// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {console2} from "forge-std/console2.sol";
import {Script} from "forge-std/Script.sol";
import {Onft} from "src/OnftHype.sol";
import {DeployHelper} from "script/Deployers/DeployHelper.sol";

contract SetPeerBase is Script, DeployHelper {
    address OnftBase;
    address OnftHype;
    uint32 Eid;

    function setUp() public {
        // You have to set these yourself

        //Set to Testnet
        OnftBase = 0x8Da2919bA1DF8B71318352bE9922BEEeDa27f3C7;
        OnftHype = 0xe94C63Ddbf3b8137bf3B426d05663a9c215609ae;
        Eid = HLTestnetEid; //This too
    }

    function run() public {
        vm.startBroadcast();
        Onft adapter = Onft(OnftHype);
        adapter.setPeer(Eid, addressToBytes32(OnftBase));
        vm.stopBroadcast();
    }
}
