// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract BankAccount {
    uint256 bal = 0;
    address public acchol;

    constructor() {
        acchol = msg.sender;
    }

    function deposit() public payable {
        require(acchol == msg.sender, "Not the account holder");
        require(msg.value > 0, "amt greter than zero");
        bal = bal + msg.value;
    }

    function withdraw() public payable  {
        require(acchol == msg.sender, "Not the account holder");
        require(msg.value > 0, "amt greter than zero");
        require(bal >= msg.value, "insufficient balance");
        bal -= msg.value;
    }

    function showbal() public view returns (uint256) {
        require(acchol==msg.sender, "not an account holder");
        return bal;

    }
}
