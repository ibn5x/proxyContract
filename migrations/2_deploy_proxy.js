const Cat = artifacts.require("Cat");
const CatUpgrade = artifacts.require("CatUpgrade");
const Proxy = artifacts.require("Proxy");

module.exports = async function (deployer, network, accounts) {
    
    //Deploy
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
 
    //Create Proxy to fool truffle 
    var proxyCat = await Cat.at(proxy.address); 
    
    //Set cat amount through proxy contract
    await proxyCat.setTheNumberOfCats(27);

    //Testing to see if working
    var numberOfCats = await proxyCat.getTheNumberOfCats();
    
    //Return result in console
    console.log(numberOfCats.toNumber()); //convert bignumber

    //Deployed update
    const catupgrade = await CatUpgrade.new();    
    proxy.upgrade(catupgrade.address);

    //checking to see if storage remains
    numberOfCats = await proxyCat.getTheNumberOfCats();
    console.log(numberOfCats.toNumber()); //return results
};
