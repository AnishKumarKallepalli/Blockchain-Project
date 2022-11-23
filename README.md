# Blockchain Final Assignment

## Team Members - (Group 34)
- [Anish Kumar Kallepalli](https://github.com/AnishKumarKallepalli) (2020A7PS0282H)
- [Anurag Bachchu Sarkar](https://github.com/AnuragSarkar3) (2020A3PS2117H)
- [Yash Pramod Kadam](https://github.com/RakuidN) (2020A3PS2123H)

## Decentralized E-commerce Application
A decentralized ecommerce application built on the Ethereum Blockchain using Ganache  (to set up a local blockchain) and Metamask (for wallet management). Features a dashboard with different items up for sale which can be bought. Once a succcesful purchase is made, a success message is displayed and the corresponding amount is subtracted from the users wallet. Details of all purchases (buyer and item ID) are stored in the blockchain.

## Dependencies
- Node.js
- Ganache
- Truffle
- MetaMask

## Setting Up the Environment
1) Ensure Node.js is already installed. If not, then install any version of Node.js (v8+) from the [official website](https://nodejs.org/en/download/)
2) Once we have this installed, use the following command line instruction to install truffle
     `npm install -g truffle`
3) Install Ganache from the [official website](https://trufflesuite.com/ganache/)
4) Install Metamask extension for your browser from the [official website](https://metamask.io/) and create a new account

## Running the dApp
1) We need to compile the Solidity files for them to be executed by the Ethereum Virtual Machine.
Open the terminal and make sure you are in the root of the directory that contains the dApp. Then run the following command 
     `truffle compile`
Once compiled successfully, you will see a message saying __> Compiled successfully using :__ followed by the version of solidity used.

2) Now open Ganache. This will generate a local blockchain on port `7545`.
Return back to the terminal and run the following command
     `truffle migrate`
This migrates the contract to the local blockchain. You will see an output with the transaction hash, account id, balance etc. Similarly, Ganache will also reflect this with a change in the state of the blockchain.

3) Connect MetaMask to the local blockchain using the following steps
    - Click the menu which shows 'Main Nettwork" and select Custom RPC
    - In the box titled __New Network__ enter `http://127.0.0.1:7545`, click Save and close the settings
    - You will notice now that your wallet has 100 ETH or a little lower (migrating costs some gas).

4) Finally, to run the dApp go back to the terminal and type
    `npm run dev`
This starts the local server on port `3000` and opens a new tab on your web browser.
A MetaMask pop-up will appear requesting your approval to connect your wallet to the dApp, without which it will be unable to interact with the dApp. Click __Connect__

5) Once this is done, you are free to make purchases from the array of items available in the shop.
Every time you make a purchase, and as long as you have enough balance in your wallet, you will be prompted to approve the transaction by MetaMask.
After confirming the transaction, ETH will be spent from your wallet and you will notice the the __Buy__ button on the product changes to __Success__ and you will also be able to see the list of all transactions in MetaMask.
