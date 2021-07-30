pragma solidity 0.8.4;

//Gives Data structure
import "./Storage.sol";

//set our inheritance from storage
contract Cat is Storage {

    modifier onlyOwner{
        require(msg.sender == owner, "Only contract owner can call this function go away");
        _;
    }

    constructor() public {
        
        owner = msg.sender;
    
    }
   
    //return our mappings
    function getTheNumberOfCats() public view returns(uint256){
        
        return _uintStorage["Cats"];
    } 
    
    function setTheNumberOfCats(uint256 toSet) public {
        
         _uintStorage["Cats"] = toSet;
    }
}
