//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/ERC1967Proxy1.sol";
import "../src/ERC1967Proxy2.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

//forge test -vvv --match-path test/ERC1967Test.t.sol
contract ERC1967Test is Test {
    function test_Upgrade() public {
        //1.部署第一个实现合约
        ERC1967Proxy1 implementaion1 = new ERC1967Proxy1();
        ERC1967Proxy proxy = new ERC1967Proxy(
            address(implementaion1),
            abi.encodeCall(implementaion1.initialize, (10))
        );
        console.log("Implementaion1 Proxy Address:", address(proxy));
        ERC1967Proxy1 proxyImp = ERC1967Proxy1(address(proxy));
        assertEq(proxyImp.value(), 10);
        //2.设置value
        proxyImp.setValue(20);
        assertEq(proxyImp.value(), 20);
        //3.升级合约
        ERC1967Proxy2 implementaion2 = new ERC1967Proxy2();
        proxyImp.upgradeToAndCall(address(implementaion2), "");
        assertEq(proxyImp.value(), 20);
        ERC1967Proxy2 proxyImp2 = ERC1967Proxy2(address(proxy));
        //4.设置value
        proxyImp2.setDoubleValue(30);
        assertEq(proxyImp2.value(), 60);
    }
}
