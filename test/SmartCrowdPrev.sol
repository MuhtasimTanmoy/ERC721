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

  function removeManager(address _manager) public{
      RemoveByValue(managerList,_manager);
      removeManagerExist(_manager);
 }

  function setManagerExist(address _manager) internal {
      managerExists[_manager]=true;
  }

  function removeManagerExist(address _manager) internal {
      managerExists[_manager]=false;
  }

  function checkManagerExist(address _manager) public view restricted returns(bool) {
      return managerExists[_manager];
  }

  function getManagerList() public  view restricted returns(address[]){
      return managerList;
  }

  //Library

  function () public payable {
   revert () ;
}


//////library

function IndexOf(address[] values, address value) internal pure returns(uint) {
  uint i = 0;
  while (values[i] != value) {
    i++;
  }
  return i;
}

/** Removes the given value in an array. */
function RemoveByValue(address[] values, address value) internal {
  uint i = IndexOf(values,value);
  RemoveByIndex(values,i);
}

function RemoveByIndex(address[] values, uint i)  internal{
  while (i<values.length-1) {
    values[i] = values[i+1];
    i++;
  }
  managerList.length--;
}
}
