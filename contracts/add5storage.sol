// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {SimpleStorage} from "./simplestorage.sol";

contract addFiveStorage is SimpleStorage {
    //+5
    //overrides
    //virtual override
    function store(uint256 _newnumber) public override { 
       myfavouritenumber = _newnumber + 5;
    }
}