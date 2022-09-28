// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

contract MyVotingContract {

    address payable voter;
    mapping(address => uint) voteCount;

    constructor() payable {
        voter = payable(msg.sender);
    }

enum votingPeriod {
        Yes,
        No
    }

    votingPeriod isVotingPeriod;

    votingPeriod constant startVotePeriod = votingPeriod.Yes;

    function stopVotePeriod() public{
        isVotingPeriod = votingPeriod.No;
    }


    function validateVote() public payable {
        require(isVotingPeriod == startVotePeriod, "you can only vote during voting period");
        require(voteCount[voter] < 1, "You can only vote once");
        voteCount[voter]++;
    }

    function sendVote(address payable _ballotAddress) public payable {
        validateVote();
        require(voter.balance >= 1, "you don't have upto 1 ether to vote");
        _ballotAddress.transfer(1 ether);
    }
    
}