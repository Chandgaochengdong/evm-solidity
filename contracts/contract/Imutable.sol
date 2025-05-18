// SPDX-License-Identifier: MIT
pragma solidity >=0.8.15 <0.9.0;


contract Consumer {
    uint constant price = 20;

    address immutable owner;
    

    constructor() {
        // balanceMap[msg.sender] = 30;
        owner = msg.sender;
    }
    function withdrawFunds (uint amount) public  {
        uint fundsAvailableToWithdraw = address(this).balance;
        if ((fundsAvailableToWithdraw >= amount)) {
            payable(owner).transfer(amount);
            
        } else{
            revert("No fund to withdraw"); 
        }  
        
    }
    
}