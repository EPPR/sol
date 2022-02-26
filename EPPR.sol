// EPPR Smart Contract (Solidity)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// v0.0.1 Last update: Feb 26th.
contract EPPR {
    // Define la variable "owner" para utilizar durante la vida de este contrato.
    address owner;
    constructor () {
        // Guarda un valor inicial en la variable "owner" (Al hacer deploy a este contrato)
        owner = msg.sender;
    }
    // Función publica: Revisa si la cuenta actual es el dueño del contrato.
    function isOwner() 
        public
        view
        returns (bool) 
    {
        if(owner == msg.sender){
            return true;
        }else{
            return false;
        }
    }
}
