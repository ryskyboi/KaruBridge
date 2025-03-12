// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {console2} from "forge-std/console2.sol";
import {Script} from "forge-std/Script.sol";
import {OnftAdapter} from "src/Onft.sol";
import {
    IONFT721,
    MessagingFee,
    MessagingReceipt,
    SendParam
} from "@layerzerolabs/onft-evm/contracts/onft721/interfaces/IONFT721.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";

import {
    IONFT721,
    MessagingFee,
    MessagingReceipt,
    SendParam
} from "@layerzerolabs/onft-evm/contracts/onft721/interfaces/IONFT721.sol";

import {DeployHelper} from "script/Deployers/DeployHelper.sol";

contract TestnetBridging is Script, DeployHelper {
    uint256 tokenId;
    uint32 dstEid;
    OnftAdapter adapter;

    function _sendParams(uint32 _dstEid, uint256 _tokenId) private view returns (SendParam memory) {
        // Use the most minimal valid options format
        bytes memory options = hex"000301001101000000000000000000000000000493e0"; // Just Type 3, with no actual options

        return SendParam(_dstEid, addressToBytes32(address(msg.sender)), _tokenId, options, bytes(""), bytes(""));
    }

    function setUp() public {
        // You have to set these yourself
        dstEid = ArbTestnetEid;
        tokenId = 145;

        adapter = OnftAdapter(0x8Da2919bA1DF8B71318352bE9922BEEeDa27f3C7);
    }

    function run() public {
        vm.startBroadcast();
        SendParam memory sendParam = _sendParams(dstEid, tokenId);
        MessagingFee memory fee = adapter.quoteSend(sendParam, false);
        IERC721(TestNetNftBase).approve(address(adapter), tokenId);
        adapter.send{value: fee.nativeFee}(sendParam, fee, payable(address(this)));
        vm.stopBroadcast();
    }
}
