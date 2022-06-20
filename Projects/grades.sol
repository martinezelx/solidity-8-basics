// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// EXAMPLE:
// -----------------------------------
//  ALUMNO   |    ID    |      NOTA
// -----------------------------------
//  Marcos |    77755N    |      5
//  Joan   |    12345X    |      9
//  Maria  |    02468T    |      2
//  Marta  |    13579U    |      3
//  Alba   |    98765Z    |      5

contract ProjectGrades{

    address public profesor;

    constructor() {
        profesor = msg.sender;
    }

    //Mapa para relacionar el hash de la id del alumno con su nota del examen
    mapping(bytes32 => uint) Notas;

    //Array de alumnos que piden la revision de examen
    string [] revisiones;

    //Eventos
    event eventoAlumnoEvaluado(bytes32, uint);
    event eventoRevision(string);

    //Funcion para evaluar alumnos
    function evaluar(string memory _idAlumno, uint _nota) public unicamenteProfesor(msg.sender) {
        
        //hash de la id del alumno
        bytes32 hashIdAlumno = keccak256(abi.encodePacked(_idAlumno));

        //Relacion entre el hash de la id del alumno con su nota
        Notas[hashIdAlumno] = _nota;

        //emitir evento
        emit eventoAlumnoEvaluado(hashIdAlumno,_nota);
    }

    
    //Control de las funciones ejecutables por el profesor
    modifier unicamenteProfesor(address _direccion){
        require(_direccion == profesor, "Error, no tienes permisos para ejecutar esta funcion.");
        _;
    }

    //Funcion para ver las notas de un alumno
    function verNotas(string memory _idAlumno) public view returns(uint) {

         //hash de la id del alumno
        bytes32 hashIdAlumno = keccak256(abi.encodePacked(_idAlumno));

        //nota asociada al has del alumno
        uint notaAlumno = Notas[hashIdAlumno];

        //visualizar la nota
        return notaAlumno;
    }

    //Funcion para pedir revision del examen
    function revision(string memory _idAlumno) public {

        //Almacenamiento de la identidad de un alumno en un array
        revisiones.push(_idAlumno);

        //emitir evento
        emit eventoRevision(_idAlumno);
    }

    //Funcion para ver los alumnos que han solicitado revision de examen
    function verRevisiones() public view unicamenteProfesor(msg.sender) returns(string[] memory) {

        return revisiones;

    }
}
