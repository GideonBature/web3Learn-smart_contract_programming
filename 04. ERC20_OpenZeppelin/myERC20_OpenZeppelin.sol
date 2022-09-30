// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GDCToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Gid Coin", "GDC") {
        _mint(msg.sender, initialSupply);
    }
}

contract ERC20FixedSupply is ERC20 {
    constructor() ERC20("Fixed", "FIX") {
        _mint(msg.sender, 1000);
    }
}

contract ERC20WithMinerReward is ERC20 {
    constructor() ERC20("Reward", "RWD") {}

    function mintMinerReward() public {
        _mint(block.coinbase, 1000);
    }
}