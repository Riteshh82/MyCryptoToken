// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyCryptoToken {
    mapping(address => uint256) private balances;

    uint256 private _totalSupply;

    string public name;
    string public symbol;
    uint8 public decimals;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(uint256 totalSupply_, string memory tokenName, string memory tokenSymbol, uint8 tokenDecimals) {
        _totalSupply = totalSupply_;
        name = tokenName;
        symbol = tokenSymbol;
        decimals = tokenDecimals;
        
        balances[msg.sender] = _totalSupply;

        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }

    function transfer(address to, uint256 amount) public returns (bool) {
        address from = msg.sender;
        require(balances[from] >= amount, "Insufficient balance");
        require(to != address(0), "Invalid address");

        balances[from] -= amount;
        balances[to] += amount;

        emit Transfer(from, to, amount);

        return true;
    }
}