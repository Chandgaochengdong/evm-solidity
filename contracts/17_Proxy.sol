// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.5 <0.9.0;

contract Proxy {
    address client_;

    constructor(address _client_ ) {
        client_ = _client_;
    }

    function proxyExcutive(bytes calldata payload) public  {
        bytes4 sig = bytes4(payload[:4]);
       if (sig == bytes4(keccak256("setOwner(address)")) ) {
            address owner = abi.decode(payload[4:], (address));
            require(owner != address(0), "Address of owner cannot be zero.");
       }
        // 3. 使用delegatecall转发调用
        (bool status,) = client_.delegatecall(payload);
        require(status, "Forwarded call failed.");

    }

}