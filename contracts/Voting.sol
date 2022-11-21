pragma solidity ^0.8.7;

contract Voting {
    event VoteResult(string message);

    address owner;
    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    struct Voter {
        bytes32 voterID;
        bool doesExist;
        mapping (uint => bool) votedPosts;
    }

    struct Candidate {
        bytes32 name;
        uint votes;
        uint postID;
        bool doesExist;
    }

    uint numCandidates;
    uint numVoters;
	uint numPosts;

    mapping (uint => Candidate) candidates;
    mapping (bytes32 => Voter) voters;
    mapping (uint => bytes32) posts;

    function createVoter (bytes32 voterID, bool doesExist) public {
        Voter storage v = voters[voterID];
        v.voterID = voterID;
        v.doesExist = doesExist;
        numVoters++;
    }

    function createCandidate(bytes32 name, uint postID) onlyOwner public {
        uint candidateID = numCandidates++;
        Candidate storage c = candidates[candidateID];
        c.name = name;
        c.votes = 0;
        c.postID = postID;
        c.doesExist = true;
    }

	function dropCandidate(uint candidateID) onlyOwner public {
        candidates[candidateID].doesExist = false;
    }

    function enableCandidate(uint candidateID) onlyOwner public {
        candidates[candidateID].doesExist = true;
    }

    function addPost(bytes32 postName) onlyOwner public {
        uint postID = numPosts++;
        posts[postID] = postName;
    }

    function vote(bytes32 voterID, uint candidateID) public {
        if (candidates[candidateID].doesExist == true) {
        	if (voters[voterID].doesExist == false) {
        		createVoter(voterID, true);
        	}
        	if (voters[voterID].votedPosts[candidates[candidateID].postID]) {
        		emit VoteResult("Your vote for this post has already been recorded.");
        	} else {
        		voters[voterID].votedPosts[candidates[candidateID].postID] = true;
        		candidates[candidateID].votes++;
                emit VoteResult("Vote for current post successfully recorded.");
        	}
        } else {
        	emit VoteResult("The candidate you are voting for does not exist.");
        }
    }

    function getTotalVotes(uint candidateID) public view returns (uint) {
        return candidates[candidateID].votes;
    }

    function getNumOfCandidates() public view returns(uint) {
        return numCandidates;
    }

    function getNumOfVoters() public view returns(uint) {
        return numVoters;
    }

    function getNumOfPosts() public view returns(uint) {
        return numPosts;
    }

    function getPost(uint postID) public view returns (uint, bytes32) {
        return (postID,posts[postID]);

    }

    function getCandidate(uint candidateID) public view returns (uint, bytes32, uint, uint, bytes32) {
        return (candidateID, candidates[candidateID].name, candidates[candidateID].votes, candidates[candidateID].postID, posts[candidates[candidateID].postID]);
    }
}
