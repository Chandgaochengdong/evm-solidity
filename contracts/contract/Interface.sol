// SPDX-License-Identifier: MIT
pragma solidity >=0.6.2 <0.9.0;

interface ParentA {
    function getToken() external  pure returns (string memory);    
}

interface ParentB {
    function getToken() external  pure returns (string memory);
}

contract Inheirted is ParentA, ParentB {


    function getToken() public override(ParentA, ParentB) pure  returns (string memory){
        return "hello world";
    }

}



