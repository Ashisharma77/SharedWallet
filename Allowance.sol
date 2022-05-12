pragma solidity ^0.8.9; 

contract Allowance { 

    address public owner; 

    constructor(){ 

        owner = msg.sender; 

    } 

    event amountwithdraw(address indexed _benificial, uint _amount); 

    event amountadded(address indexed _benificial, uint _amount); 

    mapping(address => uint) myAllowance; 

    modifier onlyOwner{ 

        require(msg.sender == owner,"you are not the owner"); 

        _; 
    } 

    function allow( address payable _who,uint _amount) onlyOwner public { 

        allowance[_who] = _amount; 

        _who.transfer(_amount); 
    } 

 

    function reduceamount(address _who,uint _amount) internal{ 

        allownce[_who]= allowance[_who]- _amount; 
        
    } 

 

 

    function withdrawmoney( address payable  add ,uint _amount) public{ 

        require(_amount<= address(this).balance,"not enough amount"); 

 

        if(!msg.sender = _mowner){ 

            reduceamount(add,_amount); 
        } 

        emit amountwithdraw(add,_amount); 

        add.transfer(_amount); 

    } 

     function fundtransfer(uint _amount,address payable _to)  onlyOwner public  { 

        _to.transfer(_amount); 
        
    } 
