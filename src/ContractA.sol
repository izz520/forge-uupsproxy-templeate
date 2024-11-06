// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract ContractA is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 public value;

    function initialize(uint256 _setValue) public initializer {
        value = _setValue;
        __Ownable_init(msg.sender);
    }

    function _authorizeUpgrade(address) internal override onlyOwner {}
}
