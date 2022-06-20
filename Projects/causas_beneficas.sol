// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract causasBeneficas {

    struct Causa {
        uint id;
        string nombre;
        uint precio_objetivo;
        uint dinero_recaudado;
    }

    uint contador_causas=0;
    mapping (string => Causa) causas;

    //Dar de alta una nueva causa
    function createCausa(string memory _nombre, uint _precio_objetivo) public payable{

        contador_causas = contador_causas++;
        causas[_nombre] = Causa(contador_causas,_nombre,_precio_objetivo,0);
    
    }

    //Devuelve true en casi de se pueda donar a una causa o false si ha llegado ya al objetivo
    function objetivoCumplido(string memory _nombre, uint _donar) private view returns (bool) {

        bool flag = false;

        Causa memory causa = causas[_nombre];

        if(causa.precio_objetivo >= (causa.dinero_recaudado + _donar)){
            flag = true;
        }

        return flag;
    }

    //Donar a una causa
    function donar(string memory _nombre, uint _cantidad) public returns(bool){

        bool isDonable = true;

        if(objetivoCumplido(_nombre,_cantidad)){
            causas[_nombre].dinero_recaudado = causas[_nombre].dinero_recaudado + _cantidad;
        } else {
            isDonable = false;
        }

        return isDonable;
    }

    //Nos indica si hemos llegado al precio objetivo
    function comprobarCausa(string memory _nombre) public view returns (bool,uint){
        bool limiteAlcanzado = false;
        Causa memory causa = causas[_nombre];

        if(causa.dinero_recaudado >= causa.precio_objetivo){
            limiteAlcanzado = true;
        }

        return (limiteAlcanzado, causa.dinero_recaudado);

    }
}
