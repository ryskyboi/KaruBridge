// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {console2} from "forge-std/console2.sol";
import {Script} from "forge-std/Script.sol";
import {Onft} from "src/OnftHype.sol";
import {DeployHelper} from "script/Deployers/DeployHelper.sol";

contract OnftDeployHypeTest is Script, DeployHelper {
    function deployHypeAdapterTest() public {
        // Fix string calldata to string memory
        string memory name = "K-16 a.k.a KARU";
        string memory symbol = "KARU";

        // Make sure constructor arguments match Onft's requirements
        // You might need to check Onft.sol for correct parameters
        Onft adapterHype = new Onft(name, symbol, HLTestnetAddress, 0x380b2BBC84629128faaE8664327780465B90601D); //This is mine But I will update
        console2.log("HypeAdapter deployed at:", address(adapterHype));
    }
}
