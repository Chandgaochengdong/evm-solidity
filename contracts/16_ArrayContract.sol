// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.7 <0.9.0;


contract ArrayContract {
    bool[2][] pairsOfFlags;

    function setAllPairsOfFlags(bool[2][] memory flags) public {
        pairsOfFlags = flags;
    }

    struct StructType {
        uint[] contents;
        uint moreInfo;
    }
    StructType s;

    function setS(uint[] memory c) public {
        StructType storage g = s;
        g.contents = c;
        g.moreInfo = 2;
    }

    function setPairFlag(uint index, bool flagA, bool flagB) public {
        pairsOfFlags[index][0] = flagA;
        pairsOfFlags[index][1] = flagB;
    }


    function clear() public {
        delete pairsOfFlags;
        pairsOfFlags = new bool[2][](0);
    }

    

}