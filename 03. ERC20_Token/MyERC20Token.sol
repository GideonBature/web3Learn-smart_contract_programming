// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

contract MyERC20Token {

    //event transfer and approval
    event Transfer(address indexed _from, address indexed _to, uint _tokens);
    event Approval(address indexed _tokenOwner, address indexed _spender, uint _token);
    
    //token name, symbol and decimal
    string public constant name = "Gid Coin";
    string public constant symbol = "GDC";
    uint8 public constant decimal = 18;

    //each address and their individual balance
    mapping(address => uint) public balances;

    //individual address and permission granted to them.
    mapping(address => mapping(address => uint)) public allowed;

    //total quantity of tokens accessible
    uint public _totalSupply;

    //net supply and balances
    constructor(uint total) payable {
        _totalSupply = total;
        balances[msg.sender] = _totalSupply;
    }

    //returns the balance of token owned by an address
    function balanceOf(address _tokenOwner) public view returns (uint) {
        return balances[_tokenOwner];
    }

    //transfer tokens to desired address from the caller address
    function transfer(address _receiver, uint _numTokens)public payable returns(bool) {
        require(balances[msg.sender] >= _numTokens, "sorry! you don't have enough token");
        balances[msg.sender] -= _numTokens;
        balances[_receiver] += _numTokens;
        emit Transfer(msg.sender, _receiver, _numTokens);
        return true;
    }

    //approve amount of token that an address can transfer
    function approve(address _tokenOwner, uint _numTokens) public payable returns(bool) {
        allowed[msg.sender][_tokenOwner] = _numTokens;
        emit Approval(msg.sender, _tokenOwner, _numTokens);
        return true;
    }

    //transfer token from one address to another address
    function transferFrom(address _from, address _to, uint _numTokens) public payable returns (bool) {
        require(balances[_from] >= _numTokens, "sorry! you don't have enough token");
        require(allowed[_from][msg.sender] >= _numTokens, "sorry! you are not allowed to send this amount of token");
        balances[_from] -= _numTokens;
        allowed[_from][msg.sender] -= _numTokens;
        balances[_to] += _numTokens;
        emit Transfer(_from, _to, _numTokens);
        return true;
    }    
}