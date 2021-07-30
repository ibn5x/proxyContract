const Cat = artifacts.require("Cat");
const Proxy = artifacts.require("Proxy");

module.exports = async function (deployer, network, accounts) {
  
    const swappable = await Cat.new();
    const proxer = await Proxy.new(swappable.address);
  

//  deployer.deploy(Migrations);
//  deployer.deploy(Migrations);
};
