// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

contract Base {
    uint x;
    
    constructor(uint _x) {
        x = _x;
    }
// 继承方式：1->2->3->base
   // function f() public virtual {
       // 函数不可以被重写 ！！
        //print(x);
        
     //
}

contract Base2 {
    uint x2;

    constructor(uint _x2) {
        x2 = _x2;
    }
}
contract Derived is Base(7){
   constructor() {

   }
}

contract Derived2 is Base {
    constructor(uint _y) Base(_y){

    }
}

abstract contract Derived3 is Base {
   constructor(uint _x) Base(_x) {}
}

contract Derived4 is Derived3 {
    constructor(uint _y) Derived3(_y) {}
}
