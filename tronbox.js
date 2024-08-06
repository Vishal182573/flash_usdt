module.exports = {
  networks: {
    development: {
      privateKey: '',
      userFeePercentage: 100,
      feeLimit: 1e8,
      fullHost: 'http://127.0.0.1:9090',
      network_id: '9'
    },
    shasta: {
      privateKey: '',
      userFeePercentage: 50,
      feeLimit: 1e8,
      fullHost: 'https://api.shasta.trongrid.io',
      network_id: '2'
    },
    mainnet: {
      privateKey: '',
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
