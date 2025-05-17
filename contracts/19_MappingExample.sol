// SPDX-License-Identifier: MIT
pragma solidity >=0.8.25 <0.9.0;

contract MappingExample {

    mapping (address => uint) public  balances;

    mapping (address => mapping (address => uint)) private  _allowances;

    event Transfer(address sender, address recipient, uint amount);

    event Approval(address owner, address spender, uint amount);

    function allownance(address owner, address recipient) public view returns (uint) {
        return _allowances[owner][recipient];
    }

    function update(uint amount) public {
        balances[msg.sender] = amount;
    }

    function transferFrom(address sender, address recipient, uint amount) public returns (bool) {
        require(_allowances[sender][recipient] > amount, "not enough amount");
        _allowances[sender][recipient] -= amount;
        _transfer(sender, recipient, amount);
        return false;
    }

    function appoval(address spender, uint amount) public returns (bool) {
        require(balances[msg.sender] > amount, "not enough balance");
        require(spender != address(0), "address error");
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function _transfer(address sender, address spender, uint amount) public returns (bool) {
        require(sender != address(0), "address error");
        require(spender != address(0), "address error");
        require(balances[sender] > amount, "not enough");
        balances[sender] -= amount;
        balances[spender] += amount;
        emit Transfer(sender, spender, amount);
        return false;
    }
}


contract MappingUser {

    MappingExample public example;
    
    constructor() {
        example = new MappingExample();
    }

    function getBalancesByAddress() public returns (uint) {
        example.update(100);
        // public 映射必须通过自动生成的 getter 函数访问（即 balances(address)）。
        return example.balances(address(this));
    }
}

// 字符串截断
contract C {
    bytes s = "abcdefgh";
    function f(bytes calldata c, bytes memory m) public view returns (bytes16, bytes3) {
        require(c.length == 16, "");
        bytes16 b = bytes16(m);  // 如果m的长度大于16，将发生截断。
        b = bytes16(s);  // 右边进行填充，所以结果是 "abcdefgh\0\0\0\0\0\0\0\0"
        bytes3 b1 = bytes3(s); // 发生截断, b1 相当于 "abc"
        b = bytes16(c[:8]);  // 同样用0进行填充
        return (b, b1);
    }
}