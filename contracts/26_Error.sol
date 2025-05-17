// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract VendingMachine {

    address owner; 
    error Uauthorized();

    function buy(uint _amount) public  payable {
        if (msg.value < _amount) {
            revert Uauthorized();
        }
        require(msg.value > _amount,"not enough balance");
        // 
    }

    function withDraw() public payable {
        if (msg.sender != owner) {
            revert Uauthorized();
        }
        payable(msg.sender).transfer(address(this).balance);
    }
}