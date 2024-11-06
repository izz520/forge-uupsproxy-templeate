// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

import "../src/Implementation.sol";
import "forge-std/Script.sol";

//forge script script/DeployImplementation.s.sol --ffi --broadcast --rpc-url localhost --private-key $LOCALPRIVATEKEY
contract DeployImplementation is Script {
    function run() public {
        vm.startBroadcast();
        Implementation implementation = new Implementation();
        uint256 number = 10;
        string memory name = "yasol";
        implementation.initialize(number, name);
        console.log("Implementation deployed at", address(implementation));
        console.log("Implementation owner at", implementation.owner());
        bytes memory data = abi.encodeCall(
            Implementation.initialize,
            (number, name)
        );

        ERC1967Proxy proxy = new ERC1967Proxy(address(implementation), data);
        Implementation implementationProxy = Implementation(address(proxy));
        console.log("Implementation proxy deployed at", address(proxy));
        console.log("Proxy Owner", implementationProxy.owner());
        vm.stopBroadcast();
    }
}
