// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract Event {
    
    uint public price = 2; // 状态变量

    // 仅作为合约事件监听
    event HighestPriceIncressed(address bidAddress, uint amount);

    function bid() public payable {
        // ....
        emit HighestPriceIncressed(msg.sender, msg.value); // 触发事件
    }

    // pure 修饰不能读取，也不能修改，只做逻辑计算
    // 修正函数命名和参数命名
    function calculateBidPrice(uint bidAmount) public pure returns (uint) {
        return bidAmount * 2;
    }

    function sendPrice() public view returns (uint) {
         return price;
    }

}