// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.9 <0.9.0;

import "./13_Oracle.sol";

contract OracleUser {
    event UpdateExchangeRate(uint exchangeRage);
    Oracle public oracle;
    uint private exchangeRate;
    address public owner;


    constructor(address _orcale) {
        oracle = Oracle(_orcale);
        owner = msg.sender;
    }


    function updateOracle(address _newOracle) public  {
        require(msg.sender == owner, "only owner");
        oracle = Oracle(_newOracle);
    }

    function buySomething() public  {
        oracle.query("usd", this.oracleResponse);
    }

    function oracleResponse(uint reponse) public {
        require(msg.sender == address(oracle), "only oracle can do this");
        exchangeRate = reponse;
        emit UpdateExchangeRate(exchangeRate);
    }

    function getExchangeRate() public view returns (uint) {
        return  exchangeRate;
    }

       
}