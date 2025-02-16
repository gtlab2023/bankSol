require("dotenv").config();
const HDWalletProvider = require("@truffle/hdwallet-provider");
const { PRIVATE_KEY, INFURA_PROJECT_ID } = process.env;
module.exports = {
  networks: {
    development: {
      host: "127.0.0.1", // Localhost (default: none)
      port: 7545, // Standard Ethereum port (default: none)
      network_id: '*', // Any network (default: none)
    },
    sepolia: {
      provider: () =>
        new HDWalletProvider(
          PRIVATE_KEY,
          `https://sepolia.infura.io/v3/${INFURA_PROJECT_ID}`
        ),
      network_id: 11155111, // Sepolia的网络ID
      gas: 4465030, // 合约部署时的最大Gas
      maxFeePerGas: 7000000000, // 设置合适的最大Gas费（例如 7 Gwei）
      maxPriorityFeePerGas: 1000000000, // 设置最大优先费用（例如 1 Gwei）
    },

  },

  // Set default mocha options here, use special reporters, etc.
  mocha: {
    // timeout: 100000
  },

  // Configure your compilers
  compilers: {
    solc: {
      version: "0.8.26", // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      settings: {
        // See the solidity docs for advice about optimization and evmVersion
        optimizer: {
          enabled: true,
          runs: 200,
        },
         evmVersion: "shanghai"
        //  evmVersion:"london"
      },
    },
  },
};
