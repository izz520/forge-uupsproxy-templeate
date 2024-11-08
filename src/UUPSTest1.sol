//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract UUPSTest1 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 public value;

    function initialize(uint256 _setValue) public initializer {
        value = _setValue;
        __Ownable_init(msg.sender);
    }

    function setValue(uint256 _setValue) public {
        value = _setValue;
    }

    function setDoubleValue(uint256 _setValue) public {
        value = _setValue * 2;
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal virtual override onlyOwner {}
}
