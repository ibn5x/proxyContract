const Cat = artifacts.require("Cat");
const Proxy = artifacts.require("Proxy");

module.exports = async function (deployer, network, accounts) {
  
    const cat = await Cat.new();
    const proxy = await Proxy.new(cat.address);
  
/*
    Here we are fooling truffle to believe that the proxy contract
    is really the functional contract. This statement takes the Cat source code 
    
    This statement takes the Cat source code and we use the truffle function .at to 
    basically tell truffle "Hey I already have a Cat contract, its deployed at this address,
    so create a 'new' instance of Cat contract but do it from my already existing deployed contract"
    
    then create a new variable with that address instance

    */
 
     var proxyCat = await Cat.at(proxy.address); 
     await proxyCat.setTheNumberOfCats(7);

    var numberOfCats = await proxyCat.getTheNumberOfCats();
    
    console.log(numberOfCats.toNumber()); //convert bignumber

};
