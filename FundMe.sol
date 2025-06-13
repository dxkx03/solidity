// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

import {PriceConvertor} from "./PriceConvertor.sol";

contract fundMe {
    using PriceConvertor for uint256;

    uint256 public constant minimumUSD = 5e18;

    address [] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable {
        // allow users to send money
        // have a minimum $ sent - let say $5
        //1/ How do we send eth to this contract?
        require(msg.value.getConversionRate() >= minimumUSD , "didn't send enough eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner{
        //for loop
        //for ( /* starting index, ending index, step amount */ )
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

          funders = new address[](0);
     
    //reset the array
  

    //withdraw the funds

    //transfer
    //payable(msg.sender).transfer(address(this).balance);

    //send
    //bool sendSuccess = payable(msg.sender).send(address(this).balance);
    //require(sendSuccess, "send failed");

    //call
    (bool callSuccess, ) = payable(msg.sender).call{value : address(this).balance}("");
    require(callSuccess, "call failed");
    
    }

    modifier onlyOwner(){
        require(msg.sender == i_owner , "only owner can do this");
        _;
    }
    
    receive() external payable{
        fund();
    }

    fallback() external payable { 
        fund();
    }

}