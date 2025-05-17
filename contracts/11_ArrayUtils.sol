// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

library ArrayUtils {

    function map(uint[] memory self,  function (uint) pure returns (uint) f) internal  pure returns (uint[] memory) {
        uint[] memory r = new uint[](self.length);
        for (uint i = 0; i < self.length; i++) {
            r[i] = f(self[i]);
        }
        return r;
    }

    function reduce(uint[] memory self, function(uint, uint) pure returns (uint) f) internal pure returns (uint)  {
        uint r = self[0];
        for (uint i = 1; i < self.length; i++) {
            r = f(r, self[i]);
        }
        return r;
    }

    function range(uint len) internal pure returns (uint[] memory) {
        uint[] memory r = new uint[](len);
        for (uint i = 0; i < len; i++)  {
            r[i] = i;
        }
        return r;
    }
    /**
            // 1. 创建固定长度的内存数组
    **/
    function createArray(uint len) public pure returns (uint[] memory) {
        return new uint[](len);
    }
            // 2. 创建可变长度的字节数组
    function createBytes(uint len) public pure returns (bytes memory ) {
        return new bytes(len);
    }

    function createMulitArray() public pure returns (uint24[2][4] memory) {
        uint24[2][4] memory m = [
            [uint24(0x1), 1], 
            [0xffffff, 2], 
            [uint24(0xff), 3], 
            [uint24(0xffff), 4]
        ];
        return m;
    }

    function createDynamicArray() public pure returns (uint24[][] memory) {
         uint24[2][4] memory fixedArray = [
            [uint24(0xfff),2],
            [uint24(0xfff),4],
            [uint24(0xfff),3],
            [uint24(0xfff),5]
        ];
        uint24[][] memory dynamicArray = new uint24[][](4);
        for (uint i = 0; i < 4; i++) {
            dynamicArray[i] = new uint24[](2);
            dynamicArray[i][0] = fixedArray[i][0];
            dynamicArray[i][1] = fixedArray[i][1];
        }
        return dynamicArray;
    }
    



    /**
    字面量常亮
    **/
    function f() public pure {
        g([uint(1),2,3]);
    }

    function g(uint[3] memory a) public pure returns (uint) {
        return  a[1] + a[0];
    }



}