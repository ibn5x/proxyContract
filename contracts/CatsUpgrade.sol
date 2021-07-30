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

    /*
        We are initializing the proxy so it has the information needed for constructor...
        Our functional contract has a constructor that requires some variable(s) [owner] for its initial state...
        The proxy contract will not know that, so we must create it via our initialize function...
        its arguements are the variables needed for constructor inital state.
        This also gives us more flexibility.

        the initialize should ONLY BE ABLE TO RUN ONCE
        or anyone can call it, and exploit contract.

        We can use our  "_initialize" variable we left in our storage contract
        to check against with a negate function requiring that the _initialized boolean
        is true, ensuring our initialize function is only run once for security.
    */
    function initialize(address _owner) public {
       require(!_initialized);
        
        owner = _owner;
    }
   
   
    function getTheNumberOfCats() public view returns(uint256){ 
        return _uintStorage["Cats"];
    } 
    
    function setTheNumberOfCats(uint256 toSet) public onlyOwner { 
         _uintStorage["Cats"] = toSet;
    }
}
