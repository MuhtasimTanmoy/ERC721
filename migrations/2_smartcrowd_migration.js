var SmartCrowd = artifacts.require("./SmartCrowd.sol");

module.exports = function(deployer) {
  deployer.deploy(SmartCrowd);
};
