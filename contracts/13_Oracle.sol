// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Oracle {

    address private owner;

    constructor(address _owner) {owner = _owner;}

    struct Request {
        bytes data;
        function(uint) external callback;
    }

    Request[] private  requests;
    event newRequest(uint);

    function query(bytes memory data, function (uint) external callback) public {
        requests.push(Request(data, callback));
        emit newRequest(requests.length - 1);
    }
    
    function reply(uint requestID, uint response) public {
        requests[requestID].callback(response);
    }

    

}