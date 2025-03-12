// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

abstract contract DeployHelper {
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

    //Just for testing
    address public ArbTestnetAddress = 0x6EDCE65403992e310A62460808c4b910D972f10f;
    uint32 public ArbTestnetEid = 40231;

    address public TestNetNftBase = 0x6f4D4Cfd81350FcB76328cD51B2a801365fa7600;

    function addressToBytes32(address _addr) public pure returns (bytes32) {
        return bytes32(uint256(uint160(_addr)));
    }
}
