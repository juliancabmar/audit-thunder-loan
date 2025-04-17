// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.20;
// @e - this is probably the interface of PoolFactory.sol from T-Swap protocol because in that exist the same function
// declaration

interface IPoolFactory {
    function getPool(address tokenAddress) external view returns (address);
}
