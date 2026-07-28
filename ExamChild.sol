//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import{BaseStorage} from "./Exam.sol";

contract MultiplyTen is BaseStorage{
      
// Changes state on the blockchain -> NO 'returns' keyword needed      
      function storeValue(uint256 _val) public override {
        storedValue = _val * 10;
      } 
}


// // Just reads state without changing anything -> NEEDS 'returns'
// function retrieve() public view returns (uint256) {
//     return storedValue;
// }