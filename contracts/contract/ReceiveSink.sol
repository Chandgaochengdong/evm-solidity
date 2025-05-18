// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.4 <0.9.0;

contract Sink {

    event AddressReceive(address receiver, uint amount);
    // 这是一个特殊的回调函数，当合约收到纯 ETH 转账（无附加数据）时自动触发。
    receive() external payable { 
        emit AddressReceive(msg.sender, msg.value);
    }

    fallback() external payable {
        emit AddressReceive(msg.sender, msg.value);
    }
}