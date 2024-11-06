// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

// import "../src/Implementation.sol";
import "forge-std/Script.sol";
import "../src/ImplementationV2.sol"; // 添加这行导入语句

//forge script script/DeployImplementation2.s.sol --ffi --broadcast --rpc-url localhost --private-key $LOCALPRIVATEKEY
contract DeployImplementation is Script {
    function run() public {
        vm.startBroadcast();
        ImplementationV2 implementation = new ImplementationV2();
        uint256 number = 10;
        string memory name = "yasol";
        implementation.initialize(number, name);
        console.log(
            "Deployed ImplementationV2 contract at address:",
            address(implementation)
        );
        vm.stopBroadcast();
    }
}
