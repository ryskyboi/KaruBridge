// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.22;

import { ONFT721Adapter } from "@layerzerolabs/onft-evm/contracts/onft721/ONFT721Adapter.sol";

//  ###          # #     # #     # ######  
//   #           # #     # ##   ## #     # 
//   #           # #     # # # # # #     # 
//   #           # #     # #  #  # ######  
//   #     #     # #     # #     # #       
//   #     #     # #     # #     # #       
//  ###     #####   #####  #     # #       

/*
 * @notice Hypio World Order
 * @dev contract for an ONFT721Adapter Hypio Bridge.
 */
contract OnftAdapter is ONFT721Adapter {
    constructor(
        address _token,
        address _lzEndpoint,
        address _owner
    ) ONFT721Adapter(_token, _lzEndpoint, _owner) {}
}