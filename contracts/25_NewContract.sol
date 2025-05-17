// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.4 <0.9.0;

contract C {
    uint public x;

    constructor(uint amount) payable  {
        x = amount;
    }
}

contract D {
    C newC = new C(24);
    function createAndEndowD(uint arg, uint amount) public payable  {
        // 构造器修饰为 payable 才能 使用 {value: amount}
        C newInstance = new C{value: amount}(arg); // 使用不同变量名
        newInstance.x();
   }

    function createCSalt(bytes32 salt, uint arg) public {
        address predictedAddress = address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xff),
            address(this),
            salt,
            keccak256(abi.encodePacked(
                type(C).creationCode,
                abi.encode(arg)
            ))
        )))));
        C c = new C{salt: salt}(arg);
        require(address(c) == predictedAddress);
    } 


    function f() public pure returns (uint, bool, uint) {
        return (7, true, 2);
    }

    function g() public pure {

        uint index;
        // 用类型声明的变量，并从返回的元组中分配，
        // 不是所有的元素都必须被指定（但数量必须匹配）。
        (uint x, , uint y) = f();
        // 交换数值的常见技巧 -- 对非数值存储类型不起作用。
        (x, y) = (y, x);
        // 元素可以不使用（也适用于变量声明）。
        (index, , ) = f(); // 将index设置为 7
    }



}