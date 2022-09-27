// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Store{
    bool internal locked;
    mapping(address=>uint256) balances;
    constructor(){
        locked = false;
    }
    modifier nonReentrancy(){
        require(!locked, "No reentrancy allowed!");
        locked = true;
        _;
        locked = false;
    }
    

    function Depositar() public payable{
                
        balances[msg.sender] += msg.value;

    }

    function Saque() public nonReentrancy{
        require(balances[msg.sender]>0,"Saldo insuficiente para sacar o dinheiro");

        (bool success,) = payable(msg.sender).call{value:balances[msg.sender]}("");

        require(success,"Houve um erro");

        balances[msg.sender] = 0;
    }

}