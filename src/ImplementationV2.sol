// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract ImplementationV2 is
    Initializable,
    OwnableUpgradeable,
    UUPSUpgradeable
{
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

    function getNumberDouble() public view returns (uint256) {
        return number * 2;
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal virtual override onlyOwner {}
}
