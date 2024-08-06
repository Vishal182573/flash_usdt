const FlashUSDT = artifacts.require("FlashUSDT");

module.exports = function(deployer) {
  deployer.deploy(FlashUSDT, 1000000); // Deploy with 1 million initial supply
};