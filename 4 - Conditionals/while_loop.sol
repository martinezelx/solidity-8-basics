// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract while_loop {
    
    //Suma de los numeros impares menores o iguales 100
    
    function suma_impares() public pure returns(uint){
        
        uint suma =0;
        uint contador=1;
        
        while(contador<100){
            
            if(contador%2!=0){
                suma = suma + contador;
            }
            
            contador++;
        }
        
        return suma;
    }
    
    //Esperar 5 segundos
    
    uint tiempo;
    
    function fijarTiempo() public{
        tiempo = block.timestamp;
    }
    
    function espera() public view returns(bool){
        
        while(block.timestamp < tiempo+ 5 seconds){
            return false;
        }
        
        return true;
    }
    
    //Siguiente numero primo
    //Numero primo es aquel que es divisible entre 1 y el mismo
    
    function siguientePrimo(uint _p) public pure returns(uint){
        
        uint contador =_p+1;
        
        while(true){
            
            //Comprobamos si contador es primo
            uint aux=2;
            bool primo =true;
            
            while(aux<contador){
                if(contador%aux==0){
                    primo =false;
                    break;
                }
                aux++;
            }
            
            if(primo==true){
                break;
            }
            
            contador++;
            
        }
        return contador;
    }
}
