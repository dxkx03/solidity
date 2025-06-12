// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage} from "./simplestorage.sol";

contract storagefactory{

    //uint256 public favouritenumber
    //type visibility name

    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public{
        SimpleStorage newSimpleStoragecontract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStoragecontract);
    }

    function sfstore(uint256 _simplestorageindex , uint256 _newsimplestoragenumber) public {
        //always need a address and and ABI-application binary interface
        //address
        //ABI
        listOfSimpleStorageContracts[_simplestorageindex].store(_newsimplestoragenumber);
    } 

    function sfget(uint256 _simplestorageindex ) public view returns (uint256){
        //return listofpeople[_simplestorageindex].favouritenumber; 
        return listOfSimpleStorageContracts[_simplestorageindex].retrieve();
    }

}