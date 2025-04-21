// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0; //solidity version

interface IERC20{

    //getters
    //define the total supply
    function totalSupply() external view returns(uint256); 
     
    //function to return the balance
    function balanceOf(address account) external view returns (uint256);  
    
    //define the allowence of a owner can spend
    function allowance(address owner, address spender) external view returns (uint256);


    //functions
    //function to transfer from sender to reciver
    function transfer(address recipient, uint256 amount) external returns (bool);
    
    //authorizes spender to spend a specified amount on behalf of msg.sender
    function approve(address spender, uint256 amount) external returns (bool);
    
    //allows spender to transfer from another address
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);


    //events to emit when transfers or approvals happen
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256);

}


//defination of the token
contract DIOCripto is IERC20{

    string public constant name = "DIO Cripto";
    string public constant symbol = "DIO";
    uint8 public constant decimals = 18;

    //mapping to hold each address` balance
    mapping (address => uint256) balances;

    //mapping to keep track of allowances owner -> spender -> amount
    mapping(address => mapping(address=>uint256)) allowed;

    //total supply
    uint256 totalSupply_ = 10 ether;


    //constructor: Assigns all tokens to the contract deployer (msg.sender)
    constructor(){
        balances[msg.sender] = totalSupply_;
    }

    // return the total supply
    function totalSupply() public override view returns (uint256) {
        return totalSupply_;
    }

    //return the balance of address
    function balanceOf(address tokenOwner) public override view returns (uint256){
        return balances[tokenOwner];
    }


    //transfer tokens from xxx to xxx
    function transfer(address receiver, uint256 numTokens) public override returns (bool) {
        
        //Ensure sender has enough tokens
        require(numTokens <= balances[msg.sender]); 

        //subtract form sender
        balances[msg.sender] = balances[msg.sender]-numTokens;

        //add to recipient
        balances[receiver] = balances[receiver]+numTokens;
        
        //emit transfer event
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }



    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        allowed[msg.sender][delegate] = numTokens; //set allowance
        emit Approval(msg.sender, delegate, numTokens); //emit approval event
        return true;
    }


    // Returns the amount a spender is allowed to spend from an owner's balance
    function allowance(address owner, address delegate) public override view returns (uint) {
        return allowed[owner][delegate];
    }


// Allows an approved spender to transfer tokens from the owner's account to another
    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
        
        //check owner balance
        require(numTokens <= balances[owner]);
        
        //check if allowed
        require(numTokens <= allowed[owner][msg.sender]);

        //subtract from owner`s balance
        balances[owner] = balances[owner]-numTokens;
        allowed[owner][msg.sender] = allowed[owner][msg.sender]-numTokens;
        
        //add to recipient`s balance
        balances[buyer] = balances[buyer]+numTokens;
        
        //emit transfer event
        emit Transfer(owner, buyer, numTokens);
        return true;
    }

}
