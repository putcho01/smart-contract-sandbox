// SushiItems.sol
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.2/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.2/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.2/contracts/utils/Strings.sol";

contract PutchoItems is ERC1155 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenCounter;

    uint256 public constant Putcho1 = 0;
    uint256 public constant Putcho2 = 1;
    uint256 public constant Putcho3 = 2;
    uint256 public constant Putcho4 = 3;
    uint256 public constant Putcho5 = 4;

    string baseMetadataURIPrefix;
    string baseMetadataURISuffix;

    constructor() ERC1155("") {
        baseMetadataURIPrefix = "https://storage.googleapis.com/hacku-nfp-icon/";
        baseMetadataURISuffix = ".png";

        // デフォルトの所有者は msg.sender
        _mint(msg.sender, Putcho1, 100, "");
        _mint(msg.sender, Putcho2, 10**9, "");
        _mint(msg.sender, Putcho3, 1, "");
        _mint(msg.sender, Putcho4, 10**9, "");
        _mint(msg.sender, Putcho5, 10**9, "");
    }

    function uri(uint256 _id) public view override returns (string memory) {
        return
            string(
                abi.encodePacked(
                    baseMetadataURIPrefix,
                    Strings.toString(_id),
                    baseMetadataURISuffix
                )
            );
    }

    function mint(uint256 _tokenId, uint256 _amount) public {
        _mint(msg.sender, _tokenId, _amount, "");
    }

    function mintBatch(uint256[] memory _tokenIds, uint256[] memory _amounts)
        public
    {
        _mintBatch(msg.sender, _tokenIds, _amounts, "");
    }

    function setBaseMetadataURI(string memory _prefix, string memory _suffix)
        public
    {
        baseMetadataURIPrefix = _prefix;
        baseMetadataURISuffix = _suffix;
    }
}
