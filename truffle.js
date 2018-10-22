module.exports = {
  migrations_directory: "./migrations",
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    }
    ,
    rinkeby: {
      host: "localhost", // Connect to geth on the specified
      port: 8545,
      from: "0x444c232811Eb58DF8CB8e808a1f969ff36C4c1F6", //our admin account address on SmartCrowd
      network_id: 4,
      gas: 4612388 // Gas limit used for deploys
    }
  }
};
