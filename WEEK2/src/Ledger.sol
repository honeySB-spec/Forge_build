// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Ledger {
    mapping(address => uint256) public balances;

    event Deposit(address indexed user, uint256 amount);

    function deposit() external payable {
        require(msg.value > 0, "Amount must be > 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
}
