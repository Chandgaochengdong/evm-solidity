// SPDX-License-Identifier: MIT
pragma solidity >=0.8.15 <0.9.0;

contract OwnedToken {

    TokenCreator tokenCreator;
    address owner;
    bytes32 name;

    event NewChangedName(bytes32 newName);

    constructor(bytes32 name_) {
        name = name_;
        owner = address(msg.sender);
        // 合约和地址之间可以相互转换
        tokenCreator = TokenCreator(msg.sender);
    } 

    function changeName(bytes32 name_) public {
        require(address(msg.sender) == address(tokenCreator), "Only tokenCreator can change");
        emit NewChangedName(name_);
        name = name_;
    }

}

contract TokenCreator {
    
    event TokenCreated(address indexed tokenAddress, bytes32 name);
    
    function createToken(bytes32 name_) public returns (address){
        OwnedToken ownedToken = new OwnedToken(name_);
        emit  TokenCreated(address(ownedToken), name_);
        return address(ownedToken);
    }

    function changeName(OwnedToken tokenAddress, bytes32 name_) public {
        // 同样，`tokenAddress` 的外部类型是简单的 `address`。
        tokenAddress.changeName(name_);
    }

    // 执行检查，以确定是否应该将代币转移到 `OwnedToken` 合约上。
    function isTokenTransferOK(address currentOwner, address newOwner)
        public
        pure
        returns (bool ok)
    {
        // 检查一个任意的条件，看是否应该进行转移。
        return keccak256(abi.encodePacked(currentOwner, newOwner))[0] == 0x7f;
    }
}