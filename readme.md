实现一个 Solidity 智能合约，实现一个 简单的去中心化存款合约 (DeFi Deposit Contract)，允许用户：
 • 存入 ETH
 • 提取存款
 • 仅允许存入用户（owner）提取合约中对应的资金
 • 记录用户存款余额
作业要求
1. 编写 Solidity 合约
 • 使用 Solidity 0.8.x 版本
 • 需要包含 deposit、withdraw 和 ownerWithdraw 方法
 • 记录每个用户的存款金额
2. 实现功能
 • ✅ 允许用户存款
 • ✅ 允许用户取款
 • ✅ 仅限存入资金的人提取所有资金
 • ✅ 记录用户的存款余额
3. 部署到测试网
 • 可选择 Remix + MetaMask 部署到 Goerli/ Sepolia 测试网(需通过水龙头领取测试代币)、部署到本地Ganach

💡 进阶挑战
1. 添加收益机制：比如，每次存款按时间计算利息，用户存得越久，利息越高。
2. 添加代币存款功能：支持存入 ERC20 代币如Yideng币，而不仅仅是 ETH。
3. 编写测试：使用 Hardhat 或 Truffle 进行单元测试，确保所有功能正常。
4. 尽量前期先不借助AI 实在写不下去的地方可以借助AI


## 迁移脚本的作用
迁移脚本（Migration Script）是 Truffle 用于管理合约部署的核心工具。它的作用包括：

控制部署顺序：

通过编号（如 1_initial_migration.js、2_deploy_contracts.js）确保合约按正确顺序部署。

处理依赖关系：

如果合约 A 依赖合约 B，可以在迁移脚本中先部署合约 B，再部署合约 A。

支持复杂部署逻辑：

可以在迁移脚本中调用 deployer 的方法（如 deployer.link、deployer.then）实现复杂逻辑。

记录部署历史：

Truffle 通过 Migrations 合约记录已执行的迁移脚本，避免重复部署

## 编写迁移脚本
自己编写js文件时部署时报错 You must specify a network_id in your 'true' configuration in order to use this network
使用`truffle create migration binkSol`就好了，后面再测试一下是不是前面要拼一个数字.
需要执行部署命令时使用`truffle migrate --network development`

