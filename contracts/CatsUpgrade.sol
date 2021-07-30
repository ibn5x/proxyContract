pragma solidity 0.8.4;


import "./Cats.sol";


contract CatUpgrade is Cat {

    
    constructor() public {
        /*
         call initialize  function, passing contract owner as argument.

         From perspective of functional contract upgrade itself, 
         (CatUpgrade) not the view of the proxy...

         
        
        */
        initialize(msg.sender);
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
       require(!_initialized); //CHECK: initialized is false
       owner = _owner; //EFFECT: set the owner
       _initialized = true; //INTERACTION: set the variable to true, so it cant be run twice  
    }
   
}
