Challenge Url: https://codehawks.cyfrin.io/c/2025-02-datingdapp/results?lt=contest&page=1&sc=xp&sj=reward&t=report

Busines Logic:
Is a Date DApp (like tinder) in what the owner recive a fee for every match.

Services:
- ensure genuine connections.
- turns every match into a meaningful, on-chain commitment.

Roles:
- User: is the one who create a NFT dating profile (NFTDP) and is looking for a match.

Dynamic:
1. User mint a NFT dating profile (NFTDP)
2. If another user like his profile, pay 1 ETH for give a "like" to his NFTDP 
3. The likes on the NFTDP are being acumulated until a match occurs
4. When a match occurs the both NFTDP funds (minus 10% of fee) are send to a shared access Wallet.
5. (How the fee is managed?)


Questions:

@? How the fees are calculated?
@? How a price T-Swap oralce is used for the fee calculation?
@? What tokens are borrowed/lended?
@? What happens if the calculated fee is zero (know issue)?
@? Why using different license types on ITSwapPool.sol (AGPL-3.0-only) and IThunderLoan.sol (MIT)?
@? How ..."The owner will vet any additional tokens before adding them to the protocol."?

[](./src/interfaces/IPoolFactory.sol)

Files:

 Checked | Code | Files
    +    | 4    | [](./src/interfaces/IPoolFactory.sol)
    +    | 4    | [](./src/interfaces/IThunderLoan.sol)
    +    | 4    | [](./src/interfaces/ITSwapPool.sol)
    +    | 13   | [](./src/interfaces/IFlashLoanReceiver.sol)
    +    | 23   | [](./src/protocol/OracleUpgradeable.sol)
    +    | 65   | [](./src/protocol/AssetToken.sol)
    -    | 172  | [](./src/upgradedProtocol/ThunderLoanUpgraded.sol)
    +    | 176  | [](./src/protocol/ThunderLoan.sol)


timestamp:

15:43:40

AUX:

-"underlying token" = USDC

-"asset token" = tlUSDC

ThunderLoan::setAllowedToken //(Set alloed tokens on "s_tokenToAssetToken" mapping)


ThunderLoan::deposit
    - mint the new tokens based in the exchange rate
    ThunderLoan::getCalculatedFee
        OracleUpgradable::getPriceInWeth
            ITSwapPool::getPriceOfOnePoolTokenInWeth
                TSwapPool::getOutputAmountBasedOnInput(
                    1e18,
                    i_poolToken.balanceOf(address(this)),
                    i_wethToken.balanceOf(address(this))
                );
    - update exchange rate += fee


ThunderLoan::redeem


ThunderLoan::flashloan


