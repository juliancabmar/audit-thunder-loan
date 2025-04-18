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
    -    | 176  | [](./src/protocol/ThunderLoan.sol)


 Exchange rate =  1 ATOK / 2 DAI
A deposit 1000 DAI  | Total deposit: 1000 DAI
B deposit 1000 DAI  | Total deposit: 2000 DAI
C deposit 1000 DAI  | Total deposit: 3000 DAI

A receive 500 ATOK
B receive 500 ATOK
C receive 500 ATOK

X borrow 1000 DAI  | Total deposit: 2000 DAI
X pay back 1000 DAI for the lending  | Total deposit: 3000 DAI
X pay back 50 DAI (5%) of fee  | Total deposit: 3050 DAI

A send 500 ATOK to the protocol
the protocol calculates: 500 / (Total ATOK) * (Total deposit) = 1016.6 DAI
A receive 1016.6 DAI  | Total deposit: 2033.4 DAI