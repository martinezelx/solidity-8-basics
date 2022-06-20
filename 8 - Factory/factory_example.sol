// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartContract1 {
    
    // Almacenamiento de la informacion del Factory
    mapping (address => address) public MiContratoPersonal;
    
    function Factory() public {
        address direccion_nuevo_contrato = address (new SmartContract2(msg.sender)); 
        MiContratoPersonal[msg.sender] = direccion_nuevo_contrato;
    }
}

contract SmartContract2 {
    
    address public owner;

    constructor (address _direccion) {
        owner = _direccion;
    }  
}

