pragma solidity 0.8.4;

//Gives Data structure
import "./Storage.sol";

//set our inheritance from storage
contract Cat is Storage {
   
    //return our mappings
    function getTheNumberOfCats() public view returns(uint256){
        
        return _uintStorage["Cats"];
    } 
    
    function setTheNumberOfCats(uint256 toSet) public {
        
         _uintStorage["Cats"] = toSet;
    }
}
