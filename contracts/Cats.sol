pragma solidity 0.8.4;

//Gives Data structure
import "./Storage.sol";

//set our inheritance from storage
contract Cat is Storage {

    modifier onlyOwner{
        require(msg.sender == owner, "Only contract owner can call this function go away");
        _;
    }

    //allow functions to continue when under normal operation (not paused)
    modifier whenNotPaused(){
       require(!_paused); 
       _;
    }

     //allow no critical functions to continue when under emergency operation (paused)
     modifier whenPaused(){
       require(_paused); 
       _;
    }

    constructor() public {
        
        owner = msg.sender;
    
    }
   
    //return our mappings
    function getTheNumberOfCats() public view returns(uint256){
        
        return _uintStorage["Cats"];
    } 
    
    function setTheNumberOfCats(uint256 toSet) public whenNotPaused {
        
         _uintStorage["Cats"] = toSet;
    }

       function pause() public onlyOwner whenNotPaused {
        _paused = true;
    }

       function unPause() public onlyOwner whenPaused {
        _paused= false;
    }
   
}
