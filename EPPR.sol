// EPPR Smart Contract (Solidity)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// v0.0.1 Last update: Feb 26th.
contract EPPR {
    // Define la variable "owner" para utilizar durante la vida de este contrato.
    address owner;
    constructor () {
        // Guarda un valor inicial en la variable "owner" (Al hacer deploy a este contrato)
        owner = 0x0000000000000000000000000000000000000000;
    }
    // Función publica: Revisa si la cuenta actual es el dueño del contrato.
    function isOwner() 
        public
        view
        onlyOwner() // Aquí se define el uso del modificador.
        returns (bool) 
    {
        if(owner == msg.sender){
            return true;
        }else{
            return false;
        }
    }
    // Modifier: Permite cambiar el comportamiento de otra función. 
    modifier onlyOwner {
        require(msg.sender == owner, "Error: Not the Owner");
        _; // Este "_;" se llama "merge wildcard" y sirve para unir las dos funciones en cadena.
    }
}
