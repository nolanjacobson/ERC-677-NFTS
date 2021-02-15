// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract LucyAndJeff is ERC721, Ownable {
    using SafeMath for uint256;
    using Strings for string;

    struct Properties {
        uint256 liberty;
        uint256 anarchy;
        uint256 tacos;
        uint256 kisses;
        uint256 bitcoin;
        uint256 privacy;
        string name;
    }

    Properties[] public properties;

    function mintLucyAndJeff() internal {
        uint256 newId = properties.length;
        uint256 liberty = 100;
        uint256 anarchy = 100;
        uint256 tacos = 100;
        uint256 kisses = 100;
        uint256 bitcoin = 100;
        uint256 privacy = 100;

        properties.push(
            Properties(
                liberty,
                anarchy,
                tacos,
                kisses,
                bitcoin,
                privacy,
                "Lucy & Jeff"
            )
        );
        _safeMint(msg.sender, newId);
    }

    constructor() public ERC721("LucyAndJeff", "TACOS") {
        mintLucyAndJeff();
    }

    function getTokenURI(uint256 tokenId) public view returns (string memory) {
        return tokenURI(tokenId);
    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI) public {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: transfer caller is not owner nor approved"
        );
        _setTokenURI(tokenId, _tokenURI);
    }

    function getNumberOfLucyAndJeff() public view returns (uint256) {
        return properties.length;
    }

    function getLucyAndJeffOverView(uint256 tokenId)
        public
        view
        returns (string memory, uint256)
    {
        return (
            properties[tokenId].name,
            properties[tokenId].liberty +
            properties[tokenId].anarchy +
            properties[tokenId].tacos +
            properties[tokenId].kisses +
            properties[tokenId].privacy +
            properties[tokenId].bitcoin
        );
    }

    function getLucyAndJeffStats(uint256 tokenId)
        public
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        return (
            properties[tokenId].liberty,
            properties[tokenId].anarchy,
            properties[tokenId].tacos,
            properties[tokenId].kisses,
            properties[tokenId].privacy,
            properties[tokenId].bitcoin
        );
    }
}
