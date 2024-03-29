// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract Buying {
address[16] public buyers;

function buy(uint itemId) public returns (uint) {
  require(itemId >= 0 && itemId <= 15);

  buyers[itemId] = msg.sender;

  return itemId;
}

function getBuyers() public view returns (address[16] memory) {
  return buyers;
}
}
