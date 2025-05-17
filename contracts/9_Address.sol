// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract AddressTransfer {

    //address payable x = payable(0x742d35Cc6634C0532925a3b844Bc454e4438f44e); // 0x123 不是有效的以太坊地址


    function tranferX() public payable {
        address payable x = payable(0x742d35Cc6634C0532925a3b844Bc454e4438f44e);  // x 被声明为可支付地址（接收方）
         // 当前合约地址（发送方）
        address contractAddress = address(this);
        //require(x.balance < 10, "Recipient has sufficient balance");
        require(address(this).balance >= 10, "Insufficient contract balance");
        x.transfer(10);
    }
    

    function deletegatCall() public {
        //bytes memory payload = abi.encodeWithSignature("register(string)", "MyName");
        bytes memory payload = abi.encodeWithSignature("register(string)", "myName");
        (bool success, bytes memory returnData) = address(0x742d35Cc6634C0532925a3b844Bc454e4438f44e).call(payload);
        require(success, "Delegate call failed");
    }
}