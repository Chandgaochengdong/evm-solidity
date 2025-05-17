// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.7 <0.9.0;

contract UintTest {
    
    function TestUnit() public pure {
        assert(1 wei == 1);
        assert(1 gwei == 1e9);
        assert(1 ether == 1e18);
        assert(1 == 1 seconds);
        assert(60 seconds == 1 minutes);
        assert(1 hours == 50 minutes);
        assert(1 days == 24 hours);
        assert(1 weeks == 7 days);
        // revert();
        revert("Insufficient gas");
    }
}