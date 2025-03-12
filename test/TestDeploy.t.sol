// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {console2} from "forge-std/console2.sol";
import {Test} from "forge-std/Test.sol";
import {OnftAdapter} from "src/Onft.sol";
import {Onft} from "src/OnftHype.sol";
import {ILayerZeroEndpointV2} from "@layerzerolabs/lz-evm-protocol-v2/contracts/interfaces/ILayerZeroEndpointV2.sol";
import {
    IONFT721,
    MessagingFee,
    MessagingReceipt,
    SendParam
} from "@layerzerolabs/onft-evm/contracts/onft721/interfaces/IONFT721.sol";

contract DeployOnftAdapters is Test {
    //Endpoint Addresses
    address public HLTestnetAddress = 0xf9e1815F151024bDE4B7C10BAC10e8Ba9F6b53E1;
    address public HLMainnetAddress = 0x3A73033C0b1407574C76BdBAc67f126f6b4a9AA9;

    address public BaseTestnetAddress = 0x6EDCE65403992e310A62460808c4b910D972f10f;
    address public BaseMainnetAddress = 0x1a44076050125825900e736c501f859c50fE728c;

    //Endpoint Eids
    uint32 public HLTestnetEid = 40362;
    uint32 public HLMainnetEid = 30367;

    uint32 public BaseTestnetEid = 40245;
    uint32 public BaseMainnetEid = 30184;

    address public TestNetNftBase = 0x6f4D4Cfd81350FcB76328cD51B2a801365fa7600;

    OnftAdapter public adapterBase;
    Onft public adapterHype;

    function addressToBytes32(address _addr) public pure returns (bytes32) {
        return bytes32(uint256(uint160(_addr)));
    }

    function deployBaseAdapterTest() public {
        address _owner = address(this);
        // Make sure OnftAdapter is not abstract
        adapterBase = new OnftAdapter(TestNetNftBase, BaseTestnetAddress, _owner);
        console2.log("Adapter deployed at:", address(adapterBase));
    }

    function deployHypeAdapterTest() public {
        // Fix string calldata to string memory
        string memory name = "K-16 a.k.a KARU";
        string memory symbol = "KARU";

        // Make sure constructor arguments match Onft's requirements
        // You might need to check Onft.sol for correct parameters
        adapterHype = new Onft(name, symbol, HLTestnetAddress, address(this));
        console2.log("HypeAdapter deployed at:", address(adapterHype));
    }

    function sendParams(uint32 dstEid, uint256 tokenId) public view returns (SendParam memory) {
        // Fix SendParam struct creation based on the actual fields defined in SendParam
        SendParam memory sendParam = SendParam({
            dstEid: dstEid,
            to: addressToBytes32(address(msg.sender)), // This will be replaced with msg.sender when used
            tokenId: tokenId,
            extraOptions: bytes("0x000301001101000000000000000000000000000493e0"), // Assuming extraOptions is bytes type
            composeMsg: bytes(""), // Assuming composeMsg is bytes type
            onftCmd: bytes("") // Assuming onftCmd is bytes type
        });
        return sendParam;
    }

    function test_run() public {
        // Load private key from .env file
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Deploy BaseAdapter to Base Testnet
        string memory baseRPC = vm.envString("BASE_TESTNET_RPC_URL");

        console2.log("Deploying BaseAdapter to Base Testnet");
        vm.createSelectFork(baseRPC);
        vm.startBroadcast(deployerPrivateKey);
        deployBaseAdapterTest();
        vm.stopBroadcast();

        // Deploy HypeAdapter to Hyperlane Testnet
        string memory hlRPC = vm.envString("HYPE_TESTNET_RPC_URL");

        console2.log("Deploying HypeAdapter to Hyperlane Testnet");
        vm.createSelectFork(hlRPC);
        vm.startBroadcast(deployerPrivateKey);
        deployHypeAdapterTest();
        vm.stopBroadcast();
    }
}
