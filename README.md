# Unhandled Transfer Failure in Solidity Withdraw Function

This repository demonstrates a common bug in Solidity smart contracts: the use of the `send()` function for transferring ether. The `send()` function does not revert on failure, making it difficult to handle transfer errors.

## Bug
The `withdraw` function uses `send()` to transfer ether to the caller.  If the receiving contract's fallback function reverts (e.g., due to insufficient gas or a failing assertion), the transaction will fail silently, leaving the funds stuck.

## Solution
The improved `withdraw` function uses `call.value()` to transfer the ether and explicitly checks the return value for errors.  If the transfer fails, it will revert.