// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract JYCToken is ERC20, Ownable {
    
    constructor(uint256 initialSupply) ERC20("duotaToken", "JYC") Ownable(msg.sender){
        _mint(msg.sender, initialSupply * 10**decimals());
    }

    // 可选：添加代币销毁功能
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // 可选：仅管理员可增发代币
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}