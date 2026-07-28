//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public{
        SimpleStorage newSimpleStorageContracts = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContracts);
    }

    function sfStore(uint256 _SimpleStorageIndex, uint256 _newSimpleStorageNumber) public{
        listOfSimpleStorageContracts[_SimpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _SimpleStorageIndex) public view returns(uint256){
        return listOfSimpleStorageContracts[_SimpleStorageIndex].retrieve();
    }

}
