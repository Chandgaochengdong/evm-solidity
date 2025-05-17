// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.6 <0.9.0;

struct Funder {
    address sender;
    uint amount;
}

contract CrowdFunding {
    struct Compaign {
        address payable benifitciary;
        uint fundingGoal;
        uint numFunders;
        uint amount;
        bool isActive;
        mapping (uint => Funder) funders;
    }
    
    uint numCompaigns;
    mapping (uint => Compaign) compaigns;

    function createCompaign(address payable benifitciary, uint amount) public {
        numCompaigns++;  //增加一个项目
        Compaign storage c = compaigns[numCompaigns];
        c.benifitciary = benifitciary;
        c.amount = amount;
    }


    function contribute(uint compaignIndex) public payable {
        Compaign storage c2 = compaigns[compaignIndex];
        c2.funders[c2.numFunders++] = Funder({
            sender: msg.sender,
            amount: msg.value
        });
        c2.amount += msg.value;
    }
    

    function checkReachGoal(uint compaignId) public payable  {
        Compaign storage c = compaigns[compaignId];
        if (c.amount >= c.fundingGoal) {
            c.benifitciary.transfer(c.amount);
            c.isActive = false;
        }
        
    }

}