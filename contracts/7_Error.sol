// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract TransferErrorTest {

    mapping (address => uint) public  balances;
    
    error NotEnoughFunds(uint requested, uint availeble);
    error InvalidAddress();

    event tranferMonitor(address indexed from, address indexed to, uint amount);

    function tranfer(address to, uint amount) public {
        if (to == address(0)) {
            revert InvalidAddress();
        }
        if (balances[msg.sender] < amount) {
            revert NotEnoughFunds(amount, balances[msg.sender]);
        }
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit tranferMonitor(msg.sender, to, amount);
    }
}