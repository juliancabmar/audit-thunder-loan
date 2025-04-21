// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// @a? why the repay() functions between use IThunderLoan and ThunderLoan have different first parameter
//  because is an updated feature
interface IThunderLoan {
    function repay(address token, uint256 amount) external;
}
