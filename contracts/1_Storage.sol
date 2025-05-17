// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {

    /**
    存储位置 
    storage： 
        位置：永久存储在区块链上（状态变量）
        生命周期：与合约生命周期相同
        访问成本：
            读取：较昂贵（约 200-800 gas）
            写入：非常昂贵（约 5000-20000 gas）
        可变性：可修改
    memory（内存）
        位置：临时内存（函数执行期间存在）
        生命周期：仅在函数执行期间存在
        访问成本：
        读取：廉价（约 3 gas）
        写入：廉价（约 3-10 gas）
        可变性：可修改
    calldata（调用数据）
        位置：只读的函数调用数据区
        生命周期：仅在函数调用期间存在
        访问成本：
        读取：最廉价（约 1-3 gas）
        写入：不可修改（编译错误）
        可变性：只读
    **/
    
    // x 的数据存储位置是 storage。
    // 这是唯一可以省略数据位置的地方。
    uint[] public x;

    function pushAndPop() public {
        x.push(uint(3));
        x.pop();
    }

    function caf(uint[] memory memoryArray) public {
        x = memoryArray; //  将整个数组拷贝到 storage 中，可行
        uint[] storage y = x; // 分配一个指针，其中 y 的数据存储位置是 storage，可行
        y[7]; // 返回第 8 个元素，可行
        y.pop(); // 通过y修改x，可行
        delete x; // 清除数组，同时修改 y，可行
        // 下面的就不可行了；需要在 storage 中创建新的未命名的临时数组，/
        // 但 storage 是“静态”分配的：
        // y = memoryArray;
        // 同样， "delete y" 也是无效的，
        // 因为对引用存储对象的局部变量的赋值只能从现有的存储对象中进行。
        // 它将 “重置” 指针，但没有任何合理的位置可以指向它。
        // 更多细节见 "delete" 操作符的文档。
        // delete y;
        g(x); // 调用 g 函数，同时移交对 x 的引用
        h(x); // 调用 h 函数，同时在 memory 中创建一个独立的临时拷贝
    }

    function g(uint[] storage) internal pure {}
    function h(uint[] memory) public pure {}
}