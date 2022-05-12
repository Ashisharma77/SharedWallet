pragma solidity ^0.8.9;

import "./Allowance.sol";

 contract SharedWallet{

     mapping(address => uint) info;

      // only owner can withdraw the money, this is for the security purpose
   // address public owner;
    function addamount() payable public{
         if(info[msg.sender] == 0){
             info[msg.sender] == msg.value;
         }

         else{
         info[msg.sender]== info[msg.sender]+ msg.value;
         }


     }


     function checkamount() public view returns(uint){
         uint balance = info[msg.sender];
         return balance;

     }

     function totalamount() public view returns(uint){
         return address(this).balance;
     }
       // give ether to the smart contract.
     function transferamount(address transferaddress,uint _amount) public payable returns(string memory){
         uint balance;
         balance = info[msg.sender];
         address  payable transferadress= payable(transferaddress);
         if(_amount<balance||_amount==balance){
             transferadress.transfer(_amount);
             info[msg.sender]= info[msg.sender] - _amount;
             return("Amount Transfered to other account");

         }
         else if(_amount>balance){
           revert("Not Enough Balance");

         }
     }

     function renouneOwnership(uint _amount) public payable returns(string memory){
         address  payable transferadress=payable(msg.sender);
         uint balance= info[msg.sender];

         if(_amount<balance||_amount==balance){
             transferadress.transfer(_amount);
             info[msg.sender]= info[msg.sender]- _amount;
             return("Amount  retreived");

         }
         else if(_amount> info[msg.sender]){
           revert("Not enough  balance");

         }
          
 }

}
