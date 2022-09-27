// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Store{

    mapping(address=>uint256) balances;

    function Depositar() public payable{
                
        balances[msg.sender] = msg.value;

    }

    function Saque() public{
        require(balances[msg.sender]>0,"Saldo insuficiente para sacar o dinheiro");

        (bool success,) = payable(msg.sender).call{value:balances[msg.sender]}("");

        require(success,"Houve um erro");
    }

}