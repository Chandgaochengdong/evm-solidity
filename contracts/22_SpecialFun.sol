// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.4 <0.9.0;

contract SpecialFun {

    /**
blockhash(uint blockNumber) returns (bytes32)： 给定区块的哈希值 - 只对最近的256个区块有效

blobhash(uint index) returns (bytes32)： 与当前交易相关联的第 index 个blob。 此带版本的哈希值是由一个表示版本的单字节（当前为 0x01 ）和紧随其后的KZG证明的SHA256哈希的最后31个字节组成。 （ EIP-4844 ）。

block.basefee (uint)： 当前区块的基本费用 （ EIP-3198 和 EIP-1559 ）

block.blobbasefee (uint): 当前区块的blob基础费用（ EIP-7516 和 EIP-4844）

block.chainid (uint)： 当前链的ID

block.coinbase (address payable)： 当前区块矿工的地址

block.difficulty (uint)： 当前区块的难度值（ EVM < Paris ）。对于其他EVM版本，它是 block.prevrandao 的一个废弃的别名，将在下一个重大改变版本中被删除。

block.gaslimit (uint)： 当前区块的燃料上限

block.number (uint)： 当前区块的区块号

block.prevrandao (uint)： 由信标链提供的随机数（ EVM >= Paris ）（见 EIP-4399 ）。

block.timestamp (uint)： 当前区块的时间戳，自Unix epoch以来的秒数

gasleft() returns (uint256)： 剩余燃料

msg.data (bytes)： 完整的调用数据

msg.sender (address)： 消息发送方（当前调用）

msg.sig (bytes4)： 调用数据的前四个字节（即函数标识符）。

msg.value (uint)： 随消息发送的 wei 的数量

tx.gasprice (uint)： 交易的燃料价格

tx.origin (address)： 交易发送方（完整调用链上的原始发送方）
    **/

    

}