// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Modifer{
    
    //Ejemplo de solo propietario del contrato puede ejecutar una funcion 
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier soloPropietario(){
        require(msg.sender==owner, "No tienes permisos para ejecutar la funcion");
        _;
    }
    
    function ejemplo1() public soloPropietario(){
        //Codigo de la funcion parar el propietario del contrato
    }
    
    struct cliente{
        address direccion;
        string nombre;
    }
    
    mapping(string => address) clientes;
    
    function altaCliente(string memory _nombre) public {
        clientes[_nombre] = msg.sender;
    }
    
    modifier soloClientes(string memory _nombre){
        require(clientes[_nombre] == msg.sender);
        _;
    }
    
    function ejemplo2(string memory _nombre) public soloClientes(_nombre){
       //Logica de la funcion para los clientes 
    }
    
    //Ejemplo de conduccion
    
    modifier MayorEdad(uint _edadMinima, uint _edadUsuario){
        require(_edadUsuario>=_edadMinima, "No tienes edad legal para conducir");
        _;
    }
    
    function conducir(uint _edad) public MayorEdad(18, _edad){
        //Codigo a ejecutar para los conductores mayores de edad 
    }
}
