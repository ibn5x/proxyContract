pragma solidity 0.8.4;

import "./Storage.sol";

contract Proxy is Storage {
    //state variable for storing functional contract address
    address currentAddress;

    //Pass functional contract address to constructor to deploy
    constructor(address _currentAddress) {
        currentAddress = _currentAddress;
    }

    //use upgrade to change current functional contract address to new address
    function upgrade(address _newAddress) public {
        currentAddress = _newAddress;
    }

    //proxy function using fallback function

    //fallback function: Redirect Functionality
   
    function() payable external{
    //Redirect to currentAddress of functional contract

    address implentation = currentAddress;
    require(currentAddress != address(0));
    bytes memory data = msg.data; //msg.data is all info about function call itself

    assembly {
        let result := delegatecall(gas, implementation, add(data, 0x20), mload(data), 0, 0)
        let size := returndatasize
        let ptr := mload(0x40);
        returndatacopy(ptr, 0, size)
        switch result
        case 0 {revert(ptr, size)}
        default {return(ptr, size)}

    }
  }
}