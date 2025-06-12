// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; //solidity versions

contract SimpleStorage {
    
    uint256 public myfavouritenumber ; // 0

    //uint256[] listoffavouritenumbers; // [0, 78, 89]
    //can create own type using struct keyword
    struct person{
        uint256 favouritenumber;
        string name;
    }
//dynamic array
    person[] public listofpeople;

    mapping(string => uint256) public nametofavouritenumber;

   // person public myfriend =person(3, "frnd");

    function store (uint _favouritenumber) public virtual {
        myfavouritenumber = _favouritenumber; //+5
    }

    function retrieve ()public view returns (uint){
         return myfavouritenumber;
    }

    function addperson(string memory _name, uint256 _favouritenumber) public{
        listofpeople.push(person(_favouritenumber , _name));
        nametofavouritenumber[_name]= _favouritenumber;
    }
}

contract SimpleStorage2{}
contract SimpleStorage3{}
contract SimpleStorage4{}