```solidity
function withdraw(uint amount) public {
    require(amount <= balanceOf[msg.sender], "Insufficient balance");
    uint balance = balanceOf[msg.sender];
    balanceOf[msg.sender] -= amount; 
    (bool success, ) = payable(msg.sender).call{value: amount}("");
    require(success, "Transfer failed");
}
```