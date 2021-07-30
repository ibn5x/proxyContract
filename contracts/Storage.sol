pragma solidity 0.8.4;

//storage is immutable, changing storage risk corrupting proxy,
//Therefore think it through! What type of storage will we need?
contract Storage {
    mapping (string => uint256) _uintStorage;
    mapping (string => address) _addressStorage;
    mapping (string => bool) _boolStorage;
    mapping (string => string) _stringStorage;
    mapping (string => bytes4) _bytesStorage;
    address public owner;
    bool public _initialized;
}