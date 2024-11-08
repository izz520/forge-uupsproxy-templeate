//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Script.sol";
import "../src/UUPSTest1.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract UUPSDemoDeploy is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("LOCALPRIVATEKEY");
        vm.startBroadcast(deployerPrivateKey);
        UUPSTest1 implementaion1 = new UUPSTest1();
        bytes memory data = abi.encodeCall(UUPSTest1.initialize, (10));
        ERC1967Proxy proxy = new ERC1967Proxy(address(implementaion1), data);
        console.log("Proxy Address:", address(proxy));
        vm.stopBroadcast();
    }
}
