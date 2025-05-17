// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./2_Owner.sol";


contract Token {
    address public owner;
    mapping (address => uint) balances;

    // 可支付的 函数
    function bid() public payable {  
        
    }
}