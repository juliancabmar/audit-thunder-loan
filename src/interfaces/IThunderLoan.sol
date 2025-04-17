// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// @? why the interface is only used in test/mocks/MockFlashLoanReceiver.sol
// @? why the repay() functions between use IThunderLoan and ThunderLoan have different first parameter
interface IThunderLoan {
    function repay(address token, uint256 amount) external;
}
