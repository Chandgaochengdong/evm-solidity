// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

interface FeedData {
    function getData(address token) external returns (uint);
}

contract FeedConsumer {
    FeedData feed;
    uint errorCount;

    function rate(address token) public returns (uint, bool) {
        require(errorCount < 9, "too more error");
        try feed.getData(token) returns (uint v) {
            return (v, true);
        } catch Error(string memory err) {
            errorCount++;
            return (0, false);
        } catch (bytes memory data) {
            errorCount ++;
        } catch Panic(uint /*errorCode*/) {
            // 在发生Panic异常的情况下执行，
            // 即出现严重的错误，如除以零或溢出。
            // 错误代码可以用来确定错误的种类。
            errorCount++;
            return (0, false);
        } catch (bytes memory  /*lowLevelData*/) {
            // 在使用revert()的情况下，会执行这个命令。
            errorCount++;
            return (0, false);
        }
    }
}    