// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract EnumTest {
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    ActionChoices choice;
    ActionChoices constant defaultChoice = ActionChoices.GoStraight;

      function setGoStraight() public {
        choice = ActionChoices.GoStraight;
    }

    /**
    public 可以从任何地方访问（外部、内部、子合约），会自动生成 getter 函数（对状态变量）
    private 只能在当前合约内部访问，不可被子合约继承
    internal 只能在当前合约和继承合约中访问，默认的可见性（如果不指定）
    external 只能从外部访问（其他合约或交易），不能在合约内部直接调用（除非使用 this.func()）
    **/

    // 由于枚举类型不属于ABI的一部分，因此对于所有来自 Solidity 外部的调用，
    // "getChoice" 的签名会自动被改成 "getChoice() returns (uint8)"。
    function getChoice() public view returns (ActionChoices) {
        return choice;
    }

    function getDefaultChoice() public pure returns (uint) {
        return uint(defaultChoice);
    }

    function getLargestValue() public pure returns (ActionChoices) {
        return type(ActionChoices).max;
    }

    function getSmallestValue() public pure returns (ActionChoices) {
        return type(ActionChoices).min;
    }

}