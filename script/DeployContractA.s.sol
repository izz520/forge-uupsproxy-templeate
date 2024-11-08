// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Script.sol";
import "../src/ContractA.sol";
import "openzeppelin-foundry-upgrades/Upgrades.sol";

//forge script script/DeployContractA.s.sol --rpc-url localhost --private-key $LOCALPRIVATEKEY --ffi --broadcast
contract ContractAScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        bytes memory data = abi.encodeCall(ContractA.initialize, (10));
        address proxy = Upgrades.deployUUPSProxy("ContractA.sol", data);
        console.log("Deploy Contract Proxy Addres To:", proxy);
        vm.stopBroadcast();
    }
}
