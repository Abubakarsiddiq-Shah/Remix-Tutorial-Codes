//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract BaseStorage{

    uint256 public storedValue;
    
    struct User{
        string name;
        uint256 id;
    }

    User[] public users;

    mapping(string=>uint256) public userToId;

    function storeValue(uint256 _val) public virtual{
        storedValue = _val;
    }

    function retrieve() public view returns(uint256){   
     //Forgot to write (uint256) and Making a state variable `public` automatically
    // creates a getter function for you, so an explicit `retrieve()` function is optional.
        return storedValue;
    }

    function addUser(string memory _name, uint256 _id) public{
        users.push(User(_name, _id)); 
        //Whenever we need to do a .push for adding a list of something we need to look the dynamic array we made on line 16  
        userToId[_name] = _id;
        //Whenever we need to map list of users we need to see mapping var we made at line 16 
    } 


}