// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {ONFT721} from "../lib/devtools/packages/onft-evm/contracts/onft721/ONFT721.sol";
import {ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/*
 #     # #     # #######     ####### #     # ####### 
 #     # #  #  # #     #     #        #   #  #       
 #     # #  #  # #     #     #         # #   #       
 ####### #  #  # #     #     #####      #    #####   
 #     # #  #  # #     # ### #         # #   #       
 #     # #  #  # #     # ### #        #   #  #       
 #     #  ## ##  ####### ### ####### #     # ####### 


 * @notice Hyperliquid blockchain is my bitch
 * @dev contract for an ONFT721Enumerable token.
 */
contract Onft is ONFT721, ERC721Enumerable {
    /**
     * @notice Initializes the Onft contract
     * @dev The constructor passes all parameters to the ONFT721 parent constructor
     * @param _name The name of the NFT collection
     * @param _symbol The symbol for the NFT collection
     * @param _lzEndpoint The address of the LayerZero endpoint on the current chain
     * @param _delegate The optional delegate address for proxy ownership
     */
    constructor(string memory _name, string memory _symbol, address _lzEndpoint, address _delegate)
        ONFT721(_name, _symbol, _lzEndpoint, _delegate)
    {}

    /**
     * @notice Returns the base URI for token metadata
     * @dev Overrides the ERC721 _baseURI function to use the baseTokenURI from ONFT721
     * @return baseTokenUri The base URI string that will be combined with token IDs to form the full URI
     */
    function _baseURI() internal view virtual override(ERC721) returns (string memory) {
        return baseTokenURI;
    }

    /**
     * @notice Returns an array of token IDs owned by the specified address
     * @dev This function simplifies the process of retrieving all tokens owned by a particular address,
     *      utilizing the ERC721Enumerable capabilities. This is especially useful for frontends and
     *      applications that need to display user-owned tokens.
     * @param owner The address to query for token ownership
     * @return tokenIds an array of token IDs owned by the given address
     */
    // function tokensOfOwner(address owner) public view returns (uint256[] memory) {
    //     uint256 tokenCount = balanceOf(owner);
    //     uint256[] memory tokens = new uint256[](tokenCount);

    //     for(uint256 i = 0; i < tokenCount; i++) {
    //         tokens[i] = tokenOfOwnerByIndex(owner, i);
    //     }

    //     return tokens;
    // }

    /**
     * @notice Updates token ownership during transfers
     * @dev This override is required due to the diamond inheritance pattern.
     *      When inheriting from both ERC721 and ERC721Enumerable (through different paths),
     *      we must explicitly specify which implementation to use. The super._update() call
     *      ensures both parent implementations are properly called.
     * @param to to The address receiving the token
     * @param tokenId The ID of the token being transferred
     * @param auth The authorized address for the transfer
     * @return previousOwner The previous owner address
     */
    function _update(address to, uint256 tokenId, address auth)
        internal
        virtual
        override(ERC721, ERC721Enumerable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }
    /**
     * @notice Increases the balance of tokens for an account
     * @dev This override is necessary due to the multiple inheritance from ERC721 and ERC721Enumerable.
     *      It ensures that when a token is minted or transferred, both the basic ERC721 balance
     *      tracking and the additional enumeration data structures in ERC721Enumerable are updated.
     * @param account The address for which to increase token balance
     * @param value The amount by which to increase the balance
     */

    function _increaseBalance(address account, uint128 value) internal virtual override(ERC721, ERC721Enumerable) {
        super._increaseBalance(account, value);
    }

    /**
     * @notice Checks if the contract supports a given interface
     * @dev This override is crucial for ERC165 interface detection. Since both parent contracts
     *      implement this function to advertise which interfaces they support, this override ensures
     *      that interfaces from all parents are properly reported. This allows external contracts
     *      to detect whether this contract supports specific functionalities.
     * @param interfaceId The interface identifier to check
     * @return isSupported indicating whether the interface is supported
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
