// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Hellonft is ERC721("HelloNft", "HNFT") {
        uint tokenId;
        mapping(address=>tokenMetaData[]) public ownershipRecord;
        struct tokenMetaData {
        uint tokenId;
        uint timeStamp;
        string tokenURI;
    }

        function mintToken(address recipient, string memory url) public payable {
        _safeMint(recipient, tokenId);
        ownershipRecord[recipient].push(tokenMetaData(tokenId, block.timestamp,
        url));
        tokenId = tokenId + 1;
    }
}