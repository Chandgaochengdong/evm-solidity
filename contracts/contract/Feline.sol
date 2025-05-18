// SPDX-License-Identifier: MIT
pragma solidity >=0.8.17 <0.9.0;

abstract contract Feline {
    function transfer(address from, address to, uint amount) public pure virtual  returns  (bool);
}

contract Cat is Feline {

    function transfer(address from, address to, uint amount) public pure  override returns (bool) {
        require(from == address(0), "");
        require(to != address(0), "");
        return true;
    }
    
   
}

contract Dog is Feline {
   string public name = "dog";

    function transfer(address from, address to, uint amount) public pure override returns (bool) {
        require(from == address(0), "");
        require(to != address(0), "");
        return true;
    }
}