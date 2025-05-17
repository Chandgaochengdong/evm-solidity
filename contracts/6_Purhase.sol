// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract Purchase {

    address public seller;

    // 函数修饰器
    modifier onlySeller {  
        require(msg.sender != seller, "Only seller can do this");
        _;  // 执行调用的函数体
    }

    function abord() public onlySeller {
        /// do something
    }

    

}