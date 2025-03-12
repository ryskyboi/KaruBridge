// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.13;

// import {SendParam} from "@layerzerolabs/onft-evm/contracts/onft721/interfaces/IONFT721.sol";

// abstract contract BridgeHelper {
//     function sendParams(
//         uint32 dstEid,
//         bytes32 to,
//         uint256 tokenId,
//         bytes calldata extraOptions,
//         bytes calldata composeMsg,
//         bytes calldata onftCmd
//     ) public view returns (SendParam memory) {
//         // Fix SendParam struct creation based on the actual fields defined in SendParam
//         SendParam memory sendParam = SendParam({
//             dstEid: dstEid,
//             to: to,
//             tokenId: tokenId,
//             extraOptions: extraOptions, // Assuming extraOptions is bytes type
//             composeMsg: composeMsg, // Assuming composeMsg is bytes type
//             onftCmd: onftCmd // Assuming onftCmd is bytes type
//         });
//         return sendParam;
//     }
// }
