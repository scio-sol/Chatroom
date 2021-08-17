// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.6;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract Chatroom {
    address payable public immutable dev;
    
    mapping( address => bytes32 ) public publicKeys;

    event announce(address from, string message);
    event whisper(address from, address to, string message);

    constructor() { dev = payable(msg.sender); }

    function say(string calldata message) external {
        emit announce(msg.sender, message);
    }

    function tell(address to, string calldata scrambledNonsense) external {
        emit whisper(msg.sender, to, scrambledNonsense);
    }

    /**

        This is the main thing. Everything else is b*lls**t.
        
        Bills'it, owned by someone named bill. 🙃

     */
    function registerKey(bytes32 key) external {
        publicKeys[msg.sender] = key;
    }

    function getKey(address receiver) view external returns(bytes32) {
        return publicKeys[receiver];
    }

    function retrieveDonations() external payable {
        dev.transfer(address(this).balance);
    }

    function retrieveTokenDonations(address c, uint256 amount) external {
        IERC20(c).transfer(dev, amount);
    }
    receive() external payable {}
    fallback() external payable {}
}