//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/UUPSTest1.sol";

contract UUPSDemoTest is Test {
    function test_Upgrade() public {
        //1.部署实现合约
        //2.部署ERC1967代理合约并初始化
        //3.判断value的值是否初始化成功
        //4.设置value的值
        //5.判断value的值是否设置成功
        //6.升级合约
        //7.判断value的值是否变化
        //8.使用更新后的方法设置value的值
        //9.判断value的值是否变化
    }
}
