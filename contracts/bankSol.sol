// SPDX-License-Identifier: MIT
pragma solidity >=0.5.8 <0.9.0;

contract BankSol {

    mapping(address => uint256) private balances;
    // 存款函数
    function deposit() public payable {
        // wei转成ether
        balances[msg.sender] += msg.value / (10^18);
    }

    // 查询余额函数
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // 提款函数
    function withdraw(uint256 amountInEther) external{
        require(balances[msg.sender] >= amountInEther, "Insufficient balance"); // 检查余额是否足够
        require(
            address(this).balance >= amountInEther,
            "Contract has insufficient funds"
        ); // 检查合约余额是否足够

 
        balances[msg.sender] -= amountInEther; // 先更新用户余额，防止重入攻击
        uint256 amountInWei = amountInEther * 1 ether; // ether转成wei
        payable(msg.sender).transfer(amountInWei); // 转账给用户
    }
}
