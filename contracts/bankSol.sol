// SPDX-License-Identifier: MIT
pragma solidity >=0.5.8 <0.9.0;

contract BankSol {
    mapping(address => uint256) private balances;
    // 存款函数
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // 查询余额函数
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // 提款函数
    function withdraw(uint256 amount) external{
        require(balances[msg.sender] >= amount, "Insufficient balance"); // 检查余额是否足够
        require(
            address(this).balance >= amount,
            "Contract has insufficient funds"
        ); // 检查合约余额是否足够

        balances[msg.sender] -= amount; // 先更新用户余额，防止重入攻击
        payable(msg.sender).transfer(amount); // 转账给用户
    }
}
