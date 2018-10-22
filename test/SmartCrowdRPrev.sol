pragma solidity ^0.4.8;

contract SmartCrowdFactory {

  // index of created contracts

  address[] public contracts;
  address[] public transactionContracts;


  // useful to know the row count in contracts index

  function getContractCount() 
    public
    constant
    returns(uint contractCount)
  {
    return contracts.length;
  }

  // deploy a new contract

  function newTitleContract()
    public
    returns(address newContract)
  {
    TitleContract c = new TitleContract();
    contracts.push(c);
    return c;
  }


   function newTransactionContract()
    public
    returns(address newContract)
  {
    TransactionContract c = new TransactionContract();
    transactionContracts.push(c);
    return c;
  }
}


contract TitleContract {

  // suppose the deployed contract has a purpose

  function getTitle()
    public
    constant
    returns (string title)
  {
    return "Title contract working";
  }    
}


contract TransactionContract {

  // suppose the deployed contract has a purpose

  function getTitle()
    public
    constant
    returns (string title)
  {
    return "Transaction contract working";
  }    
}
