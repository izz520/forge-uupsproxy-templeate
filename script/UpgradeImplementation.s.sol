// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/Implementation.sol";
import "../src/ImplementationV2.sol";

// import "@openzeppelin/contracts/proxy/utils/UUPSUpgradeable.sol";

//forge script script/UpgradeImplementation.s.sol --ffi --broadcast --rpc-url localhost --private-key $LOCALPRIVATEKEY
contract UpgradeImplementation is Script {
    address public proxyAddress = 0xA51c1fc2f0D1a1b8494Ed1FE312d7C3a78Ed91C0;

    function run() public {
        vm.broadcast();
        ImplementationV2 implementationv2 = new ImplementationV2();
        UUPSUpgradeable uups = UUPSUpgradeable(proxyAddress);
        uups.upgradeToAndCall(address(implementationv2), "");
        vm.stopBroadcast();
    }
}
