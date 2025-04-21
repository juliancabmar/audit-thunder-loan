// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.20;

// @audit-info - IThunderLoan is used indirectly by test/mocks/MockFlashLoanReceiver.sol, but not in this file
import { IThunderLoan } from "./IThunderLoan.sol";

/**
 * @dev Inspired by Aave:
 * https://github.com/aave/aave-v3-core/blob/master/contracts/flashloan/interfaces/IFlashLoanReceiver.sol
 */
interface IFlashLoanReceiver {
    // @ audit-info natspect missing for this function
    function executeOperation(
        address token,
        uint256 amount,
        uint256 fee,
        address initiator,
        bytes calldata params
    )
        external
        returns (bool);
}
