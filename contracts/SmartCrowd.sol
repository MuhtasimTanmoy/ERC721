pragma solidity ^0.4.8;

contract Title {
    
    // This declares a new complex type which will
    // be used for variables later.
    // It will represent a property on SmartCrowd.
    
    //Property specific attributes that will never change
     struct Property {
        bytes32 name;  //Property Name
        bytes32 loaction;  //Location Name
        uint registrationNo;   // reg no
    }
    bytes32 public smartCrowdPropertyId;
    uint public tokenCount;
    
    //address to determine priviledge
    address public admin;
    address public manager;
    address public broker;
    
    uint public propertyValue;
    
    //Follwing attributes will change
    uint public tokenValue;
    
    //priviledged to be changed by only manager
     struct Expense {
         uint rentalIcome;
         uint maintenanceCost; 
         uint bills;
    }
    
    Property public info;
    Expense public expense;
    
    event LogPropertyValueChange(uint amount);
    
    function () public payable {
        revert () ;
    }
    constructor(bytes32 _name,bytes32 _loaction,uint _registrationNo,bytes32 _id,uint _tokenCount) public{
        admin=msg.sender;
        info.name=_name;
        info.loaction=_loaction;
        info.registrationNo=_registrationNo;
        smartCrowdPropertyId=_id;
        tokenCount=_tokenCount;
    }
    function setManager(address _manager) public returns(bool success){
          require(
            msg.sender == admin,
            "Only Admin can assign manager"
        );
        manager=_manager;
        return true;
    }
    function setBroker(address _broker) public returns(bool success){
             require(
            msg.sender == admin,
            "Only Admin can assign broker"
        );
        broker=_broker;
        return true;
    }
    function setPropertyValue(uint _propertyValue) public returns(bool success){
             require(
            msg.sender == admin,
            "Only Admin can set value"
        );
        propertyValue=_propertyValue;
        emit LogPropertyValueChange(_propertyValue);
        require(tokenCount!=0, "Not zero check");
        tokenValue=propertyValue/tokenCount;
        return true;
    }
    function setExpense(uint _rentalIcome,uint _maintenanceCost,uint _bills) public returns(bool success){
             require(
            msg.sender == admin,
            "Only Admin can assign broker"
        );
        expense.rentalIcome=_rentalIcome;
        expense.maintenanceCost=_maintenanceCost;
        expense.bills=_bills;
        return true;
    }
}



