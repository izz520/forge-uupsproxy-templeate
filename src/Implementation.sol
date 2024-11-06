// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract Implementation is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 public number;
    string public name;

    function initialize(
        uint256 newNumber,
        string memory newName
    ) public initializer {
        number = newNumber;
        name = newName;
        __Ownable_init(msg.sender);
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal virtual override onlyOwner {}
}
