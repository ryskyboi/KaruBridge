// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {console2} from "forge-std/console2.sol";
import {Script} from "forge-std/Script.sol";
import {OnftAdapter} from "src/Onft.sol";

import {DeployHelper} from "script/Deployers/DeployHelper.sol";

// import {Onft} from "src/OnftHype.sol";
// import {ILayerZeroEndpointV2} from "@layerzerolabs/lz-evm-protocol-v2/contracts/interfaces/ILayerZeroEndpointV2.sol";
// import { IONFT721, MessagingFee, MessagingReceipt, SendParam } from "@layerzerolabs/onft-evm/contracts/onft721/interfaces/IONFT721.sol";

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract DeployOnftAdapters is Script, DeployHelper {
    function deployBaseAdapterTest() public {
        // Make sure OnftAdapter is not abstract
        OnftAdapter adapterBase =
            new OnftAdapter(TestNetNftBase, BaseTestnetAddress, 0x380b2BBC84629128faaE8664327780465B90601D);
        console2.log("Adapter deployed at:", address(adapterBase));
    }

    function run() public {
        vm.startBroadcast();
        deployBaseAdapterTest();
        vm.stopBroadcast();
    }
}
