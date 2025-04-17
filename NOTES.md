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


@? How the fees are calculated
@? How a price T-Swap oralce is used for the fee calculation
@? What tokens are borrowed/lended
@? What happens if the calculated fee is zero (know issue)


Files:

cloc --by-file ./src

-------------------------------------------------------------------------------------------------
File                                                          blank        comment           code
-------------------------------------------------------------------------------------------------
./src/protocol/ThunderLoan.sol                                   30             98            176
./src/upgradedProtocol/ThunderLoanUpgraded.sol                   29             91            172
./src/protocol/AssetToken.sol                                    16             24             65
./src/protocol/OracleUpgradeable.sol                              7              5             23
./src/interfaces/IFlashLoanReceiver.sol                           2              5             13
./src/interfaces/IPoolFactory.sol                                 1              3              4 @Check
./src/interfaces/ITSwapPool.sol                                   1              1              4
./src/interfaces/IThunderLoan.sol                                 1              1              4 
-------------------------------------------------------------------------------------------------
SUM:                                                             87            228            461
-------------------------------------------------------------------------------------------------
