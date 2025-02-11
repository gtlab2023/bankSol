const BankSol = artifacts.require("bankSol");

module.exports = function (deployer) {
  deployer.deploy(BankSol);
};