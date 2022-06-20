ERC20
ERC721
ERC1155
Governor
 Copy to Clipboard
 Open in Remix
 Download
settings
Name
Rabbitmansion
Symbol
Rabbit
Base URI
https://img.freepik.com/free-vector/white-rabbit-cartoon-white-background_1308-66612.jpg?w=2000
features
Mintable
Auto Increment Ids
Burnable
Pausable
Votes
Enumerable
URI Storage
access control
Ownable
Roles
upgradeability

Transparent
UUPS
info
Security Contact
kittinut.pkt@gmail.com
License
MIT
 Forum
 Docs
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/// @custom:security-contact kittinut.pkt@gmail.com
contract HotelNFT is ERC721, ERC721URIStorage, ERC721Burnable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("Rabbitmansion", "Rabbit") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://img.freepik.com/free-vector/white-rabbit-cartoon-white-background_1308-66612.jpg?w=2000";
    }

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}