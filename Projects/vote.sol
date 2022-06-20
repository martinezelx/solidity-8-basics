// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

contract votacion {

    //direccion del propietario del contrato
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    //relacion nombre candidato -> hash de sus datos personales
    mapping(string=>bytes32) idsCandidatos;

    //relacion nombre candidato -> numero de votos
    mapping(string=>uint) votosCandidatos;

    //lista con todos los candidatos
    string[] candidatos;

    //lista de votantes (hash para preservar su anonimato)
    bytes32[] votantes;

    //funcion publica para presentarse a las elecciones
    function representar(string memory _nombre, uint _edad, string memory _idPersona) public {

        //hash del candidato
        bytes32 hashCanditato = keccak256(abi.encodePacked(_nombre,_edad,_idPersona));

        //guardamos hash de candidato
        idsCandidatos[_nombre] = hashCanditato;

        //guardamos el nombre del candidato en el array
        candidatos.push(_nombre);

    }

    //funcion para ver los candidatos presentados
    function verCandidatos() public view returns(string[] memory) {
        return candidatos;
    }

    //funcion para votar a un candidato
    function votar(string memory _candidato) public {
        
        //calculamos hash de la persona que ejecuta esta funcion
        bytes32 hashVotante = keccak256(abi.encodePacked(msg.sender));

        //verificamos si la persona ya ha votado o no
        for(uint i=0; i<votantes.length; i++){
            require(votantes[i]!=hashVotante,"Ya has votado previamente");
        }

        //almacenados el has del votante en el array de votantes
        votantes.push(hashVotante);

        //añadir el voto al candidato
        votosCandidatos[_candidato]++;
    }

    //ver el numero de votos que tiene un candidato
    function verVotos(string memory _candidato) public view returns(uint) {
        return votosCandidatos[_candidato];
    }

    //Funcion auxiliar que transforma un uint a un string
    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }

    //ver los votos de cada uno de los candidatos
    function verResultados() public view returns(string memory) {

        //guardamos los candidatos con sus votos (todos seguidos en el mismo string)
        string memory resultados = "";

        //recoremos el array de candidatos para actualizar el string resultados
        for(uint i=0; i<candidatos.length; i++){
            //actualizamos el string resultados y añadimos el candidato[i] del array y su numero de votos
            resultados = string(abi.encodePacked(resultados, "(", candidatos[i] ," , ", uint2str(verVotos(candidatos[i])), ") ------"));
        }    
    }

    //ver el nombre del candidato con mas votos
    function verGanador() public view returns(string memory) {

        //igualamos ganador a la primera posicion del array para que sea mas facil implementar la logica del for
        string memory ganador = candidatos[0];

        //usamos para la logica de empate
        bool flag;

        //recorrer candidatos para ver cual tiene mas votos
        for(uint i=1; i<candidatos.length; i++){
            if(votosCandidatos[ganador] < votosCandidatos[candidatos[i]]) {
                ganador = candidatos[i];
            } else {
                //caso de que tengan los mismo votos
                if(votosCandidatos[ganador] == votosCandidatos[candidatos[i]]) {
                    flag = true;
                } else {
                    flag = false;
                }
            }
        }

        //comprobamos el empate
        if(flag==true) {
            ganador = "Habemus empate!";
        }

        return ganador;
    }
}
