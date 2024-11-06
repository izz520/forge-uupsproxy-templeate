// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Script.sol";
import "../src/ContractA.sol";
import "openzeppelin-foundry-upgrades/Upgrades.sol";

//forge script script/UpgrageContractA.s.sol --rpc-url algen2_test --private-key $ALGPRIVATEKEY --ffi --broadcast
contract UpgrageContractA is Script {
    function setUp() public {}

    function run() public {
        address proxy = 0x8Fa1392440E7c2Db0a6454Ec3E5491d27C21BAc6;
        vm.startBroadcast();
        Upgrades.upgradeProxy(proxy, "ContractB.sol", "");
        console.log("Upgrade Proxy Successfully");
        vm.stopBroadcast();
    }
}
