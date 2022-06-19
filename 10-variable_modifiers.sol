// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract public_private_internal {
    
    //public access
    uint public _uint = 45;
    string public _string = "Martinez";
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    //private access
    uint private _uint_private = 10;
    bool private flag =true;
    
    function test(uint _k) public {
        _uint_private = _k;
    }
    
    //internal access
    bytes32 internal hash = keccak256(abi.encodePacked("hola"));
    address internal _address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;  
}
