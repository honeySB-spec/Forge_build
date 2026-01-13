// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Ledger.sol";

contract LedgerTest is Test {
    Ledger public ledger;
    address public user = address(1);

    event Deposit(address indexed user, uint256 amount);

    function setUp() public {
        ledger = new Ledger();
        vm.deal(user, 10 ether);
    }

    function test_Deposit() public {
        vm.prank(user);
        
        vm.expectEmit(true, false, false, true);
        emit Deposit(user, 1 ether);
        
        ledger.deposit{value: 1 ether}();

        assertEq(ledger.balances(user), 1 ether);
    }

    function test_DepositZeroAmountRevert() public {
        vm.prank(user);
        vm.expectRevert("Amount must be > 0");
        ledger.deposit{value: 0}();
    }
}
