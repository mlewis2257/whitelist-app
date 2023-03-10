const { ethers } = require("hardhat");

async function main() {
  const whitelistContract = await ethers.getContractFactory("WhitelistDapp");
  const deployedWhitelistContract = await whitelistContract.deploy(10);

  await deployedWhitelistContract.deployed();
  console.log("Whitelist Contract Address:", deployedWhitelistContract.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
