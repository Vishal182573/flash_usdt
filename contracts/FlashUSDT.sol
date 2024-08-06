// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../tron-contracts/token/TRC20/TRC20.sol";
import "../tron-contracts/token/TRC20/TRC20Detailed.sol";

contract FlashUSDT is TRC20, TRC20Detailed {
    constructor(uint256 initialSupply) TRC20Detailed("Flash USDT", "fUSDT", 6) {
        _mint(msg.sender, initialSupply * (10 ** uint256(decimals())));
    }

    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}