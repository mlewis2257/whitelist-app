// SPDX-License-Identifier: MIY
pragma solidity ^0.8.0;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract WhitelistDapp {
    // Max number of Whitelisted Addresses
    uint8 public maxAddressesWhitelisted;

    // Create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    // NOTE: Don't change this variable name, as it will be part of verification
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxAddressesWhitelisted) {
        maxAddressesWhitelisted = _maxAddressesWhitelisted;
    }

    /**
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */
    function addAddressesToWhitelist() public {
        // check if the user has already been whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Address already has been whitelisted"
        );
        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(
            numAddressesWhitelisted < maxAddressesWhitelisted,
            "More addresses cannot be added, contract reached it's limit"
        );
        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}
