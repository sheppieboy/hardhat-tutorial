// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

contract Token {
    string public name = "Practice token";
    string public symbal = "PT";

    uint256 public totalSupply = 1000000;

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

    //function to transfer tokens
    //external modifier makes a function only callable from outside the contract

    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");

        //transfer the amount
        balances[msg.sender] -= amount;
        balances[to] += amount;

        //notify offshcain applications of transfer
        emit Transfer(msg.sender, to, amount);
    }

    //Read only function to retrieve the token balance of a given account
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}
