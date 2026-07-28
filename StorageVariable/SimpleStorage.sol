//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract SimpleStorage{

    uint256 myFavouriteNumber; // Introducing myFavouriteNumber variable

    Person[] public listOfPeople; // Created a dynamic array to add list of people into it and used at line 41

    mapping(string => uint256) public nameTofavouriteNumber; // mapped name(string) with number (uint256) so a string can give favouriteNumber as an output

    struct Person{                    // Created a new varible Person which include person name and favourite number as an input 
       uint256 favouriteNumber;
       string name;
    }

/*
    In default function type we need to pass an argument on what to modify like here we did introduce a new local var uint256 
    and named it _favouriteNumber then told the function that myFavouriteNumber = _favouriteNumber. In retrieve we did not 
    write anything in the argument because we want it to just view the state variable and not to modify it.
*/

    function store(uint256 _favouriteNumber) public virtual /*It was used for overrding in child contract*/ {
        myFavouriteNumber = _favouriteNumber;
    }

/*
     So we wrote view during retrieve is because we want that function to read the 
     state variable while we did not wrote it in store function cause 
     we dont need to read that variable but modify it which uses default function type and cost gas
*/

    function retrieve() public view returns(uint256){
        return myFavouriteNumber;
    }
/*
    We did not use view function in line 40 because we are adding listOfPeople which is modifying the state variable
*/

    function addPerson(string memory _name, uint256 _favouriteNumber) public{
        listOfPeople.push(Person(_favouriteNumber, _name)); //.push() is used to append a new element to the end of a dynamic array (listOfPeople.push(...).
        nameTofavouriteNumber[_name] = _favouriteNumber; 

        // Square brackets `[...]` are used to access or assign a key's value in a mapping, and to declare or index arrays.
     
        // It's saying:"Find the slot corresponding to `_name` inside `nameTofavouriteNumber`, and assign `_favouriteNumber` to it.
    
       //string memory _name: Tells Solidity to temporarily hold the _name text in memory while addPerson runs.

       /* 
       Why not for uint256?: Value types like uint256 have a fixed, known size (32 bytes), 
       so Solidity handles their location automatically without needing a location keyword.
       */
}

    }

