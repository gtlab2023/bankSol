const MyContract = artifacts.require("bankSol");

module.exports = function (deployer) {
  deployer.deploy(MyContract);
};