// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.20;

// @a? Why are only using the pool token price in WETH?
// is a bug
interface ITSwapPool {
    function getPriceOfOnePoolTokenInWeth() external view returns (uint256);
}
