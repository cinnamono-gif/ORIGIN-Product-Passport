# ORIGIN Product Passport

**Student:** Manal Imran  
**Student ID:** 24I-5610  
**Course:** MG3012 Blockchain Technology for Business  
**Assignment:** 2 — Mini dApp

## Overview

ORIGIN is a single-page decentralized application for registering products and transferring their registered ownership on Ethereum Sepolia. Each product passport contains a product name, serial number, optional image URL, and current owner's wallet address. MetaMask approves transactions; ethers.js connects the HTML interface to the Solidity contract.

## Deployed contract

- Network: Ethereum Sepolia
- Chain ID: 11155111
- Contract address: `0xf5ac331361d5bd1AD7D40ab891C58717f9F486ED`
- [View contract on Sepolia Etherscan](https://sepolia.etherscan.io/address/0xf5ac331361d5bd1AD7D40ab891C58717f9F486ED)

## Technologies and files

- Solidity, with pragma `^0.8.24`, developed and deployed using Remix.
- HTML, embedded CSS, and JavaScript in `index.html`.
- ethers.js 6.7.0 loaded from cdnjs.
- MetaMask browser extension.
- `SmartContract.sol`: ProductPassport contract source.
- `screenshots/`: deployment and interface evidence, transaction confirmations, and a video demonstration.
- `style.css` is unused; styling is embedded in the HTML.

## Setup and usage

1. Open the project folder in VS Code.
2. Install Live Server by Ritwick Dey if it is not already installed.
3. Right-click `index.html` and select **Open with Live Server**.
4. Open the localhost URL in Chrome with MetaMask installed. Do not open the HTML as a `file:///` URL.
5. Click **Connect MetaMask**, choose the account to authorize, and approve the connection. Approve a switch to Ethereum Sepolia if requested.
6. Product #1 loads automatically when products exist. Enter another positive product ID and click **Look up** to retrieve its passport.
7. To register a product, enter its name, an unused serial number, and optionally a direct HTTPS image URL. Click **Create passport** and confirm in MetaMask.
8. Wait for confirmation. The new passport and transaction link appear automatically.
9. To transfer a loaded product you own, enter a different recipient's wallet address, click **Transfer loaded product**, and confirm in MetaMask.
10. To use another account, click the wallet button again and authorize only the desired account in MetaMask's account selection.

No npm installation or build is required. An internet connection is required to load ethers.js, access Sepolia, and display external images. Writes require Sepolia ETH for gas. Read-only lookups do not submit transactions.

## Smart contract functions

| Function | Type | Purpose |
| --- | --- | --- |
| `registerProduct(name, serialNumber, imageUrl)` | Write | Creates a product owned by the caller and emits its ID. |
| `getProduct(productId)` | Read | Returns the product's name, serial, image URL, and owner. |
| `transferOwnership(productId, newOwner)` | Write | Allows the current owner to assign a different nonzero owner. |
| `getProductCount()` | Read | Returns the number of registered products. |

Serial numbers are case-sensitive. The contract includes duplicate serial checks, field length limits, product existence checks, and ownership restrictions on transfers.

## Demonstrated features and results

The screenshots and student-provided recording document the following successful interactions:

- **Wallet connection:** The interface displays the connected wallet and a successful Sepolia connection message.
- **Product lookup:** Product #1 displays Doc Martens Boots and its registered owner. Product #2 displays Adidas Yeezy Foam Runner with serial `AYF-001`.
- **External product image:** The Yeezy passport displays the supplied product photograph.
- **Product registration:** The interface reports a confirmed registration transaction and displays the resulting product passport.
- **Ownership transfer:** The student reports demonstrating registration and transfer in `08-product-registration-and-transfer-demo.mp4`; `09-confirmed-transfer-transaction.png` records the subsequent transaction confirmation supplied for the transfer step.
- **Transaction feedback:** Successful writes display a confirmation message and an Etherscan transaction link.
- **Account selection:** The connection flow was updated to request fresh MetaMask account permissions, and the student confirmed that account switching worked.

Duplicate rejection and unauthorized transfer rejection are implemented but are not claimed here as separately demonstrated tests.

## Recorded transaction hashes

These hashes were transcribed from the supplied confirmation screenshots. The operation labels follow the demonstrated workflow; explorer details can be checked using the links.

**Product registration** (`06-registration-transaction-confirmed.png`):

`0x78465159835c317e28ef04cca4e506e358da807d2ec2befc291092ed5ccb36e2`

[View registration transaction](https://sepolia.etherscan.io/tx/0x78465159835c317e28ef04cca4e506e358da807d2ec2befc291092ed5ccb36e2)

**Transfer-step confirmation** (`09-confirmed-transfer-transaction.png`):

`0xcfec057707ef25eed76699958a4a356cbe74dafc297f7b8f70b373564d5e72bf`

[View transfer-step transaction](https://sepolia.etherscan.io/tx/0xcfec057707ef25eed76699958a4a356cbe74dafc297f7b8f70b373564d5e72bf)

## Scope and limitations

Anyone may register a product. The passport records ownership within this contract; it does not establish physical authenticity, legal title, or an ERC-721 NFT. Product fields and wallet addresses are public. Image files remain on external servers and may become unavailable; an illustrative sneaker is used when an image is absent or fails to load. Transfers change the onchain owner and require careful recipient address entry.

## Bonus Etherscan source verification

The deployed ProductPassport contract is marked **Source Code Verified — Exact Match** on Etherscan Sepolia. The verified compiler version shown by the explorer is **v0.8.34+commit.80d5c536**, with optimization disabled. The Solidity source pragma `^0.8.24` permits this compiler version.

[View verified contract source](https://sepolia.etherscan.io/address/0xf5ac331361d5bd1ad7d40ab891c58717f9f486ed#code)

Evidence: `screenshots/10-etherscan-source-verified.png`.
