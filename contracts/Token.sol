// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

contract Token {
    string public name = "Practice token";
    string public symbal = "PT";

    uint256 totalSupply = 1000000;

    address public owner;

    //store each account's balance
    mapping(address => uint256) balances;

    // The Transfer event helps off-chain applications understand
    // what happens within in contract.
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    constructor() {
        //account that deployed contract recieves all the tokens upon deployment
        balances[msg.sender] = totalSupply;
        //set owner
        owner = msg.sender;
    }
}
