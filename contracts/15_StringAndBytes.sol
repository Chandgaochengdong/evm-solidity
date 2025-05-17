// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.7 <0.9.0;

contract StringAndBytes {

    function test(bytes calldata bc, string memory sm, bytes16 b) public pure  {
        string memory s1 = "hello";
        string memory s2 = "world";
        bool eq = keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2));
        require(eq, "not eq");
        string.concat(string(bc), s1, s2);
        bytes memory concatBytes = bytes.concat(bytes(s1), bc, bc[:2], "Literal", bytes(sm), b);
        assert(concatBytes.length == 30);
    }
}