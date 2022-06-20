// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Rquire{
    
    //Funcion que verfique la contraseña
    function password(string memory _pas) public pure returns(string memory){
        require(keccak256(abi.encodePacked(_pas))!=keccak256(abi.encodePacked("12345")), "Password incorrecta");
        return "password correcta";
    }
    
    //Funcion para pagar
    uint tiempo=0;
    uint public cartera=0;
    
    function pagar(uint _cantidad) public returns(uint){
        require(block.timestamp > tiempo + 5 seconds, "Aun no puedes pagar");
        tiempo = block.timestamp;
        cartera = cartera + _cantidad;
        return cartera;
    }
    
    //funcion con una lista
    
    string [] nombres;
    
    function nuevoNombre(string memory _nombre) public{
        for(uint i =0; i<nombres.length; i++){
            require(keccak256(abi.encodePacked(_nombre))!=keccak256(abi.encodePacked(nombres[i])), "ya esta en la lista");
        }
        
        nombres.push(_nombre);
    }    
}
