// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; //version de compilador

contract BasicContract {

    //variables de estado (storage del contrato)
    address owner;

    //ejemplo constructor (opcional)
    constructor() {
        owner = msg.sender;
    }

}
