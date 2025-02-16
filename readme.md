## 需求

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

## 步骤

1. truffle init
2. 配置truffle-config.js,添加网络配置
3. 获取sepolia eth,通过fauct获取
4. 编写智能合约，truffle create contract MyContract
5. 编写迁移脚本，truffle create migration binkSol
6. 部署合约到sepolia测试网，truffle migrate --network sepolia
7. 验证部署
   1. 使用Etherscan查看合约，在以太坊和测试网上，Etherscan提供了区块链浏览器，可以方便地查询合约部署情况。在Sepolia测试网上，你可以使用 Sepolia Etherscan。合约部署后，你会获得一个合约地址。访问Etherscan并在搜索框中输入你的合约地址。如果合约部署成功，你应该能看到合约的基本信息、交易记录等.
   2. 通过truffle控制台验证，`truffle console --network sepolia`,在控制台实例化合约并读取状态
8. 部署后的合约地址在build后的abi中networks可以找到
```javascript
const instance = await MyContract.deployed();
const greeting = await instance.greeting();
console.log(greeting);  // 输出合约中的状态
```

## 细节

### 迁移脚本的作用

迁移脚本（Migration Script）是 Truffle 用于管理合约部署的核心工具。它的作用包括：

1. 制部署顺序：

通过编号（如 1_initial_migration.js、2_deploy_contracts.js）确保合约按正确顺序部署。

2. 处理依赖关系：

如果合约 A 依赖合约 B，可以在迁移脚本中先部署合约 B，再部署合约 A。

3. 支持复杂部署逻辑：

可以在迁移脚本中调用 deployer 的方法（如 deployer.link、deployer.then）实现复杂逻辑。

4. 记录部署历史：

Truffle 通过 Migrations 合约记录已执行的迁移脚本，避免重复部署

## 问题

### 1.编写迁移脚本

自己编写js文件时部署时报错 You must specify a network_id in your 'true' configuration in order to use this network  
使用`truffle create migration binkSol`就好了，后面再测试一下是不是前面要拼一个数字.  
需要执行部署命令时使用`truffle migrate --network development`

### 2. 转账的时候如何确定币种呢？
msg.value的变量单位是wei，可以使用1 ether = 10^18 wei来进行处理

### 3. could not deploy due to insufficient funds
 钱包里没钱，需要找水龙头领取测试代币
### 4. 部署时报错Transaction's maxFeePerGas (1000000000) is less than the block's baseFeePerGas (6440285650) (vm hf=shanghai -> block -> tx)
这个问题通常出现在EIP-1559激活的网络（如Sepolia、Goerli等），在这些网络中，交易费由 maxFeePerGas 和 maxPriorityFeePerGas。需要在 truffle-config.js 中使用 EIP-1559 格式的 gas 费设置，而不是传统的gasPrice。EIP-1559 采用了 maxFeePerGas 和 maxPriorityFeePerGas 来控制交易费用
### 5.本地部署时报错hit an invalid opcode while deploying
truffle-config.json里配置好evmVersion: "byzantium"的版本，就可以成功部署了,最后真正检测需要在london版本之前才可以
## 其他

不需要条件的免费水龙头  
[https://thirdweb.com/sepolia](https://thirdweb.com/sepolia)  
[https://www.sepoliafaucet.io/](https://www.sepoliafaucet.io/)  
[https://cloud.google.com/application/web3/faucet/ethereum/sepolia](https://cloud.google.com/application/web3/faucet/ethereum/sepolia)


