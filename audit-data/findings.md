## Severity


### [H-#] Unnecesary `AssetToken::updateExchangeRate` call in `ThunderLoan::deposit` causes protocol to think it has more fees than it really does, which blocks the liquidity provider's funds redeemption.

**Description:**\
The `ThunderLoan::deposit` function make a fee calculation based on the deposited underlying, and with this, update the exchange rate between the underlying and assets tokens incrementing in a way that when the asset holder want to redeem his underllying with his assets, the protocol will calculate with the new exchange rate an amount that will be superior than    

**Impact:**\

**Proof of Concept:**\

**Recommended Mitigation:**\
