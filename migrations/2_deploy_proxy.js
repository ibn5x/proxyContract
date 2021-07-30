const Cat = artifacts.require("Cat");
const Proxy = artifacts.require("Proxy");

module.exports = async function (deployer, network, accounts) {
  const Cats = await Cat.new;
  const proxy = await Proxy.new(dogs.address);

//  deployer.deploy(Migrations);
//  deployer.deploy(Migrations);
};
