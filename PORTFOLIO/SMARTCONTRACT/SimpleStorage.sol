// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
contract SimpleStorage {
    uint256 value = 101;
    function set(uint256 _value) public {
            value = _value;
    }

    function get() public view returns (uint256) {
        return value;
    }

}