//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Script.sol";
import "../src/UUPSTest1.sol";

// import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

//forge script script/UUPSDemoUpgrade.s.sol --rpc-url localhost --private-key $LOCALPRIVATEKEY --ffi --broadcast --force
contract UUPSDemoUpgrade is Script {
    address proxyAddress = 0xA51c1fc2f0D1a1b8494Ed1FE312d7C3a78Ed91C0;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("LOCALPRIVATEKEY");
        address deployer = vm.addr(deployerPrivateKey);
        vm.startBroadcast(deployer);
        UUPSTest1 implementaion1 = UUPSTest1(payable(proxyAddress));
        UUPSTest1 newImplementaion = new UUPSTest1();
        implementaion1.upgradeToAndCall(address(newImplementaion), "");
        console.log("Upgrade Success");
        vm.stopBroadcast();
    }
}
