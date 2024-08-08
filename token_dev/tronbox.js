module.exports = {
  networks: {
    development: {
      privateKey: 'f67f6a3c89415d15dfd27be7d7f7ebdaa39ea01d84a7d4e05e4db0ae6d6393d3',
      userFeePercentage: 100,
      feeLimit: 1e8,
      fullHost: 'http://127.0.0.1:9090',
      network_id: '9'
    },
    shasta: {
      privateKey: 'f67f6a3c89415d15dfd27be7d7f7ebdaa39ea01d84a7d4e05e4db0ae6d6393d3',
      userFeePercentage: 50,
      feeLimit: 1e8,
      fullHost: 'https://api.shasta.trongrid.io',
      network_id: '2'
    },
    mainnet: {
      privateKey: 'f67f6a3c89415d15dfd27be7d7f7ebdaa39ea01d84a7d4e05e4db0ae6d6393d3',
      userFeePercentage: 100,
      feeLimit: 1e8,
      fullHost: 'https://api.trongrid.io',
      network_id: '1'
    }
  },
  compilers: {
    solc: {
      version: "0.8.0",
      optimizer: {
        enabled: true,
        runs: 200
      },
      evmVersion: "petersburg"
    }
  },
  contracts_directory: './contracts',
  contracts_build_directory: './build/contracts',
  migrations_directory: './migrations',
};