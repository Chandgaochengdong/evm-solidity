// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.12 <0.9.0;


contract Owned {

    address payable owner;

    constructor() {
        owner = payable (msg.sender);
    }

    modifier OnlyOwner {
        require(msg.sender == owner, "Only Owner can call");
        _;
    }
}


contract Destructible is Owned{

    function selfDestroy() public OnlyOwner {
        disableContract();
    }

     // 更安全的替代方案 - 禁用合约
    function disableContract() internal  OnlyOwner {
        owner = payable(address(0));  // 设置为零地址禁用
    }    
}


contract Priced {

    modifier cost(uint price) {
        require(msg.value > price , "address amount not enough");
        _;
    }
}

contract Registered is Priced, Destructible {

    mapping (address => bool) registerAddress;
    uint price;

    constructor(uint _price) {
        price = _price;
        owner = payable (msg.sender);  // 调用自己的方法
    }

    function register() public payable cost(price) {
        registerAddress[msg.sender] = true;
    }


    function setPrice(uint newPrice) public OnlyOwner {
         price = newPrice;
    }

}
