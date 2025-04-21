#  DIO Cripto (ERC-20)

DIO Cripto is a lightweight and educational implementation of the ERC-20 standard using Solidity. 
This smart contract provides a foundational understanding of how ERC-20 tokens work under the hood, with full support for token transfers, approvals, and delegated transfers.

---

## 🚀 Features

- ✅ ERC-20 compliant
- ✅ Token metadata (`name`, `symbol`, `decimals`)
- ✅ `transfer` tokens between addresses
- ✅ `approve` and `transferFrom` for delegated transfers
- ✅ Emits `Transfer` and `Approval` events
- ✅ Compatible with MetaMask, Remix, and Ganache

---

## 🔧 Smart Contract Info

- **Contract Name**: `DIOCripto`
- **Symbol**: `DIO`
- **Decimals**: `18`
- **Total Supply**: `10` DIO (i.e., `10 * 10^18` units)

```solidity
constructor() {
    balances[msg.sender] = totalSupply_;
}

```
## 🛠️ Getting Started

Requirements

* Node.js

* Ganache

* MetaMask

* Remix IDE

Deploying on `Ganache` via `Remix`

Launch Ganache and copy the RPC URL (e.g., http://127.0.0.1:7545)

Add the network to MetaMask using the same RPC and chain ID (1337 or 5777)

Import one of Ganache’s private keys into MetaMask


## Open Remix

Compile `DiOCripto.sol` using `Solidity ^0.8.0`

In the Deploy & Run Transactions tab, choose Injected Provider - MetaMask

Deploy the contract (constructor requires no parameters)

Interact with the deployed contract functions via Remix

## 🧪 Testing Functions

- transfer(address recipient, uint256 amount)

- approve(address spender, uint256 amount)

- transferFrom(address sender, address recipient, uint256 amount)

- balanceOf(address account)

- allowance(address owner, address spender)
