pragma solidity ^0.4.23;

contract SmartCrowd {
  address public admin;
  address [] private managerList;
  mapping (address => bool) private managerExists;

 event managerAdded(address _manager);

  modifier restricted() {
    if (msg.sender == admin) _;
  }

  constructor() public {
    admin = msg.sender; //this constructor will run only once
  }

  function addManager(address _manager) public restricted returns(bool){
    managerList.push(_manager);
    setManagerExist(_manager);
    emit managerAdded(_manager);
    return true;
  }

  function setManagerExist(address _manager) internal {
      managerExists[_manager]=true;
  }

  function getManagerExist(address _manager) public view restricted returns(bool) {
      return managerExists[_manager];
  }

  function getManagerList() public  view restricted returns(address[]){
      return managerList;
  }

  //Library

  function () public payable {
   revert () ;
}


}
