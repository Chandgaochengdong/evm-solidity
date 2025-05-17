// SPDX-License-Identifier: MIT
pragma solidity >=0.5 <0.9.0;

import "./11_ArrayUtils.sol";

contract Pyramid {

    using  ArrayUtils for *;


    function pyramid(uint l) internal pure returns (uint) {
       return ArrayUtils.range(l).map(square).reduce(sum);
    }


    function square(uint x) internal pure returns (uint) {
        return  x * x;
    }

    function sum(uint x, uint y) internal  pure returns (uint) {
        return x + y;
    }

}