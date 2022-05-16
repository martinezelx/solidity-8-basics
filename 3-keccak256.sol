// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract keccak256Hash{

    //Computo de hash de un string
    function CalculateHash(string memory _cadena) public pure returns(bytes32){
        return keccak256(abi.encodePacked(_cadena));
    }

    //Computo de hash de un string, entero y direccion
    function CalculateHash2(string memory _cadena, uint _k, address _direccion) public pure returns(bytes32){
        return keccak256(abi.encodePacked(_cadena, _k, _direccion));
    }

    //Computo de hash de un string, entero y direccion mas dos parametros directos
    function CalculateHash3(string memory _cadena, uint _k, address _direccion) public pure returns(bytes32){
        return keccak256(abi.encodePacked(_cadena, _k, _direccion, "hola", uint(2)));
    }
}
