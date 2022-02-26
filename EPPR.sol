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
    // Función pública: Revisa si la cuenta actual es el dueño del contrato.
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
    // Función pública: Transfiere este contracto a otra cuenta. (Solo los dueños pueden transferir el contrato y no puedes transferirlo a ti mismo)
    function transferContract(address _to) 
        public
        onlyOwner()
        throwIfIsOwnerBytes32(_to)
        returns (bool) 
    {
        owner = _to;
        return true;
    }
    // Función pública: No tiene mods, cualquier persona puede leer esta info, imprime la dirección actual definida como "owner"
    function getOwner() 
        public
        view
        returns (address) 
    {
        return owner;
    }
    // Modifier: Permite cambiar el comportamiento de otra función. 
    modifier onlyOwner {
        require(msg.sender == owner, "You Are Not The Owner.");
        _; // Este "_;" se llama "merge wildcard" y sirve para unir las dos funciones en cadena.
    }
    // Mod para cancelar la transacción en caso que la cuenta sea el dueño de este contrato.
    modifier throwIfIsOwnerBytes32(address _id) {
        require(_id != owner, "Invalid transfer destination.");
        _;
    }
}
