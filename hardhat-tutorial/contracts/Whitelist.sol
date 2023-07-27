// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;
    uint8 public numAddressesWhitelisted;
    mapping (address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "You have already reserved your spot in my whitelist!");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Uh oh! All the whitelist spots have already been reserved. Better luck next time!");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}