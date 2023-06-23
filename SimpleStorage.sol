// EVM: Ethereum Virtual Machine
// Ethereum, Polygon, Arbitrum, Optimism, Zksync, etc...

// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    // favoriteNumber gets initialized to 0 if no value is given!
    // the default visibility is 'internal'
    // STATE VARIABLE & STORAGE VARIABLE
    uint256 public myFavoriteNumber; // 0

    // uint256[] listOfFavoriteNumbers;

    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    // Person public pat = Person(7, "Pat");
    // Person public pat = Person({favoriteNumber: 7, name: "Pat"});

    // dynamic array
    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    // static array
    // Person[3] public listOfPeopleStatic;

    // public creates a getter automatically

    // the _ before the parameter is a convention 
    // to name the LOCAL VARIABLES
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;

        // even if get7() is a pure function, if called by a non view/pure
        // function, it increments the calling function's gas cost!
        // get7();

        // without get7() -> 22542 gas
        // WITH get7() -> 22582 gas
    }

    // 'view' & 'pure' are keywords used to mark functions that 
    // DON'T change the state of the blockchain
    
    // function getFavoriteNumber() public view returns(uint256) {
    //    return myFavoriteNumber;
    // }

    // in specific, pure can be used when a function doesn't read/write
    // anything on the blockchain (favoriteNumber is a storage variable,
    // meaning that it's stored in the blockchain)
    function get7() public pure returns(uint) {
        return 7;
    }

    // calldata & memory -> the variable exists only for the duration
    // of the function call

    // memory VS calldata: 
    // - memory CAN be changed
    // - calldata CANNOT be changed
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // Person memory newPerson = Person(_favoriteNumber, _name);
        // listOfPeople.push(newPerson);

        //_name = "cat";
        listOfPeople.push(Person(_name, _favoriteNumber));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}