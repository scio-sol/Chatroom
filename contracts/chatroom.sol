// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.6;

contract Chatroom {
    
    mapping( address => bytes32 ) public publicKeys;

    event announce(address from, string message);
    event whisper(address from, address to, string message);

    function say(string calldata message) public {

    }

    function say(string calldata message, address to) public {

    }

    function sayAnonymously(string calldata message) public {

    }

    function sayAnonymously(string calldata message, address to) public {

    }

    function registerKey(bytes32 key) public {

    }
}