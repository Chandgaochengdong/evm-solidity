// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

contract InfoFeed {

    function info() public payable returns (uint) {
        return 24;
    }
}

contract Consumer {

    InfoFeed feed;
    
    function setFeed(InfoFeed addr) public { 
        feed = addr; 
    }
    
    function callFeed() public {
        feed.info{value:10, gas: 300}();
    }

    

}