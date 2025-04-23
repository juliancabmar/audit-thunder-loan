## Severity


### [H-#] Unnecesary `AssetToken::updateExchangeRate` call in `ThunderLoan::deposit` causes protocol to think it has more fees than it really does, which blocks the liquidity provider's funds redeemption.

**Description:**\
The `ThunderLoan::deposit` function make a fee calculation based on the deposited underlying, and with this, update the exchange rate between the underlying and assets tokens incrementing in a way that when the asset holder want to redeem his underllying with his assets, this new exchange rate, will make what the protocol try to transfer to the user more than its really have, blocking the transaction with a "insuficient balance" error.

<details><summary>Code</summary>

```javascript
function deposit(IERC20 token, uint256 amount) external revertIfZero(amount) revertIfNotAllowedToken(token) {
    AssetToken assetToken = s_tokenToAssetToken[token];
    uint256 exchangeRate = assetToken.getExchangeRate();

    uint256 mintAmount = (amount * assetToken.EXCHANGE_RATE_PRECISION()) / exchangeRate;
    emit Deposit(msg.sender, token, amount);
    assetToken.mint(msg.sender, mintAmount);
    
@>  uint256 calculatedFee = getCalculatedFee(token, amount);
@>  assetToken.updateExchangeRate(calculatedFee);

    token.safeTransferFrom(msg.sender, address(assetToken), amount);
}
```
</details>

**Impact:**
1. The `redeem` function will fail with "insufficient balance" error when the user tries to redeem his assets for the underlying token. 
2. Rewards are incorrectly calculated.

**Proof of Concept:**
1. LP deposits
2. User takes out a flash loan
3. It is now impossible for LP to redeem.

<details>
<summary>Proof of code</summary>

Place the following into `ThunderLoanTest.t.sol`

```javascript
function testRedeemAfterLoan() public setAllowedToken hasDeposits {
    AssetToken asset = thunderLoan.getAssetFromToken(tokenA);
    uint256 amountToBorrow = AMOUNT * 10;
    uint256 calculatedFee = thunderLoan.getCalculatedFee(tokenA, amountToBorrow);

    vm.startPrank(user);
    tokenA.mint(address(mockFlashLoanReceiver), calculatedFee); // mint some tokens for cancel the fees
    thunderLoan.flashloan(address(mockFlashLoanReceiver), tokenA, amountToBorrow, "");
    vm.stopPrank();

    uint256 amountToRedeem = asset.balanceOf(liquidityProvider);

    vm.prank(liquidityProvider);
    thunderLoan.redeem(tokenA, amountToRedeem);
}
```
</details>

**Recommended Mitigation:**\
Remove the incorrect `updateExchangeRate` call from the `deposit` function.

<details>
<summary>Mitigation</summary>

```diff
function deposit(IERC20 token, uint256 amount) external revertIfZero(amount) revertIfNotAllowedToken(token) {
    AssetToken assetToken = s_tokenToAssetToken[token];
    uint256 exchangeRate = assetToken.getExchangeRate();

    uint256 mintAmount = (amount * assetToken.EXCHANGE_RATE_PRECISION()) / exchangeRate;
    emit Deposit(msg.sender, token, amount);
    assetToken.mint(msg.sender, mintAmount);
    
-   uint256 calculatedFee = getCalculatedFee(token, amount);
-   assetToken.updateExchangeRate(calculatedFee);

    token.safeTransferFrom(msg.sender, address(assetToken), amount);
}
```
</details>
