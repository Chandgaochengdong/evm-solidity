// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ParamFun {

    mapping (string => uint) private  data;

    function f() public {
        setParam({key: "hello", value: 3});
        setParam("hhh", 3);
    }

    function setParam(string memory key, uint value) public{
        data[key] = value;
    }

     // 省略参数名称
    function func(uint k, uint) public pure returns(uint) {
        return k;
    }
}