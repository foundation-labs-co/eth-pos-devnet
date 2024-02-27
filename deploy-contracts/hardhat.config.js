/** @type import('hardhat/config').HardhatUserConfig */
require("dotenv").config();
require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: {
    version: "0.6.11",
  },
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545/",
      chainId: 1234,
      accounts: [`0x${process.env.PRIVATE_KEY}`],
    },
  }
};