pragma solidity 0.8.4;


import "./Storage.sol";


contract CatUpgrade is Storage {

    modifier onlyOwner{
        require(msg.sender == owner, "Only contract owner can call this function go away");
        _;
    }

    constructor() public {
        
        owner = msg.sender;
    
    }
   
   
    function getTheNumberOfCats() public view returns(uint256){ 
        return _uintStorage["Cats"];
    } 
    
    function setTheNumberOfCats(uint256 toSet) public onlyOwner { 
         _uintStorage["Cats"] = toSet;
    }
}
