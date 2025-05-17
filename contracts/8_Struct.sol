// SPDX-License-Identifier: MIT
pragma solidity >=0.7 <0.9;

contract StructTest {

    uint a;
    uint8 b;
    fixed8x10 c;
    ufixed16x24 d;
    bool flag;
    address payable  sender;
    address to;
    

    struct Vote {
        uint vote;
        bool voted;
        uint weight;
        address delegate;
    }

    enum State {
        Created,
        Updated,
        Deleted,
        Query,
        Locked,
        Inactive
    }
    
    function testStruct() public payable returns (bytes32) {
        return "hello";
    }


}