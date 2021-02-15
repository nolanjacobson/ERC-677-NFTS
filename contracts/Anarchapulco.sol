// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Anarchapulco is ERC721, Ownable {
    using SafeMath for uint256;
    using Strings for string;
    address private creator;
    struct Speaker {
        uint256 libertyLevel;
        uint256 anarchyLevel;
        uint256 tacosLevel;
        uint256 kissesLevel;
        uint256 bitcoinLevel;
        uint256 privacyLevel;
        uint256 spirtualityLevel;
        uint256 agoraLevel;
        uint256 ogLevel;
        string name;
    }

    Speaker[] public speakers;

    constructor() public ERC721("AnarchapulcoSpeaker", "BREATHE") {
        creator = msg.sender;
    }

    function mintSpeaker(uint256 libertyLevel, uint256 anarchyLevel, uint256 tacosLevel, uint256 kissesLevel, uint256 bitcoinLevel, uint256 privacyLevel, uint256 spirtualityLevel, uint256 agoraLevel, uint256 ogLevel, string memory name) public {
        require(
            msg.sender == creator,
            "Only the creator of this contract can mint new NFT's"
        );
        uint256 newId = speakers.length;
        speakers.push(
            Speaker(
                libertyLevel,
                anarchyLevel,
                tacosLevel,
                kissesLevel,
                bitcoinLevel,
                privacyLevel,
                spirtualityLevel,
                agoraLevel,
                ogLevel,
                name
            )
        );
        _safeMint(msg.sender, newId);
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

    function getNumberOfSpeakers() public view returns (uint256) {
        return speakers.length;
    }

    function getSpeakersOverView(uint256 tokenId)
        public
        view
        returns (string memory, uint256)
    {
        return (
            speakers[tokenId].name,
            speakers[tokenId].libertyLevel +
            speakers[tokenId].anarchyLevel +
            speakers[tokenId].tacosLevel +
            speakers[tokenId].kissesLevel +
            speakers[tokenId].privacyLevel +
            speakers[tokenId].bitcoinLevel +
            speakers[tokenId].privacyLevel +
            speakers[tokenId].spirtualityLevel +
            speakers[tokenId].agoraLevel +
            speakers[tokenId].ogLevel
        );
    }

    function getSpeakerStats(uint256 tokenId)
        public
        view
        returns (
            Speaker memory
        )
    {
        return (
            speakers[tokenId]
        );
    }
}
