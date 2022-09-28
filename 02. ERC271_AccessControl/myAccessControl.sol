// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

contract AccessControl {

    address owner;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => bool) public roles;

    function setRoles(address _addr) public {
        require(owner == msg.sender, "you can't set roles");
        roles[_addr] = true;
    }

    function addNums(uint _a, uint _b)public view returns(uint) {
        require(roles[msg.sender]== true || owner == msg.sender, "sorry! you can't perform Addition");
        return _a + _b;
    }

    function subtractNums(uint _a, uint _b)public view returns(uint) {
        require(roles[msg.sender]== true || owner == msg.sender, "sorry! you can't perform Subtraction");
        return _a - _b;
    }

}