//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConvertor} from "./PriceConvertor.sol";

contract FundMe{
    
    using PriceConvertor for uint256;
     
    uint256 public constant MINIMUM_USD = 50 * 1e18;

    address[] public funders;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    mapping(address funders => uint256 amuountFunded) public addressToAmountFunded;

    function fund() public payable{
         
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Minimum accepted amount is 5 ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;  
    }

    function withdraw() public onlyOwner{

        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex ++){
            address funder = funders [funderIndex];
            addressToAmountFunded[funder] = 0;
        }

    funders = new address[](0);
    (bool callSuccess, ) = payable(msg.sender).call{value:address(this).balance}("");
    require (callSuccess, "Call Failed");
    }

    modifier onlyOwner() {
      require(msg.sender == i_owner, "Must be the Owner!");
      _;
    }

    receive() external payable{
        fund();
    }

    fallback() external payable{
        fund();
    }

}