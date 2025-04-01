# 🚀 BountyBoard Smart Contract + Frontend 🎯

## 🔥 Overview
The **BountyBoard** project includes both a **smart contract** and a **frontend** for managing bounties on the Ethereum blockchain. Users can create, assign, and complete tasks while ensuring secure reward distribution. 💰

## ✨ Features
### 🛠 Smart Contract
- ✅ **Task Creation**: Only the contract owner can create tasks and must fund them with ETH.
- 👤 **Task Assignment**: The owner assigns tasks to specific assignees.
- 🎯 **Task Completion**: The assigned user can mark the task as completed.
- 💵 **Reward Distribution**: The owner releases the reward to the assignee upon task completion.
- 🔒 **Secure Transactions**: Uses `.call{value: reward}()` to transfer rewards safely.

### 💻 Frontend
- 📋 **User Dashboard**: Displays available tasks, assigned tasks, and completed tasks.
- 📝 **Task Creation**: Allows the owner to create and fund tasks.
- 🤝 **Task Assignment**: Assigns tasks through an interactive UI.
- 🎉 **Completion and Rewards**: Users can mark tasks as complete, and the owner can distribute rewards.
- 🌐 **Web3 Integration**: Connects with MetaMask for interacting with the contract.

## 🚀 Deployment
### 🔧 Prerequisites
- 🖥 **Node.js & npm/yarn**
- 🔥 **Hardhat or Truffle**
- ⛓ **Solidity ^0.8.0**
- 💼 **MetaMask or any Web3 wallet**
- ⚛ **React.js for the frontend**

### ⚡ Steps
#### 📜 Smart Contract Deployment
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/bountyboard.git
   cd bountyboard
   ```
2. Install dependencies:
   ```sh
   npm install
   ```
3. Compile the contract:
   ```sh
   npx hardhat compile
   ```
4. Deploy the contract (modify `deploy.js` if necessary):
   ```sh
   npx hardhat run scripts/deploy.js --network opencampus
   ```
5. **Deployed Contract Address**: 🏛 `0xE2099EE2D5456998C6eae7AeA6FaC681efc3D802`

#### 🌍 Frontend Setup
1. Navigate to the frontend directory:
   ```sh
   cd frontend
   ```
2. Install dependencies:
   ```sh
   npm install
   ```
3. Start the development server:
   ```sh
   npm start
   ```
4. Open `http://localhost:3000` in your browser. 🌐

## ⚙️ Smart Contract Methods

### 🔹 `createTask(string _description, uint _reward)`
- 📌 **Description**: Creates a task with a reward.
- 🔐 **Requires**: `msg.value == _reward`.
- 🎊 **Emits**: `TaskCreated` event.

### 🔹 `assignTask(uint _taskId, address payable _assignee)`
- 📌 **Description**: Assigns a task to an assignee.
- 🔐 **Requires**: Only the owner can assign.
- 🎊 **Emits**: `TaskAssigned` event.

### 🔹 `completeTask(uint _taskId)`
- 📌 **Description**: Marks the task as completed by the assignee.
- 🔐 **Requires**: Caller must be the assigned user.
- 🎊 **Emits**: `TaskCompleted` event.

### 🔹 `distributeReward(uint _taskId)`
- 📌 **Description**: Transfers the reward to the assignee upon completion.
- 🔐 **Requires**: Task must be completed and reward not already claimed.
- 🎊 **Emits**: `RewardDistributed` event.

### 🔹 `fundContract()`
- 📌 **Description**: Allows users to fund the contract for rewards.
- 🔐 **Requires**: ETH transfer in `msg.value`.

## 🎨 Frontend Features
- 🔗 **Connect Wallet**: Uses Web3.js or ethers.js to connect with MetaMask.
- 📊 **View Tasks**: Displays all tasks with their statuses.
- 🎯 **Assign & Complete Tasks**: UI components for assignment and completion.
- 💸 **Reward Distribution**: The owner can distribute rewards via the UI.

## 📢 Events
| 🏷 Event             | 📜 Description                                       |
|------------------|---------------------------------------------------|
| 🎨 `TaskCreated`    | Triggered when a task is created.                 |
| 🔗 `TaskAssigned`   | Triggered when a task is assigned.                |
| ✅ `TaskCompleted`  | Triggered when a task is marked as completed.      |
| 🎁 `RewardDistributed` | Triggered when a reward is successfully distributed. |

## 🔐 Security Considerations
- 🛡 **Only the owner** can assign tasks and distribute rewards.
- 💰 **Rewards must be pre-funded** to prevent unpaid tasks.
- ⚡ **Uses `.call{value: reward}()`** instead of `.transfer()` for better gas handling.

## 📜 License
This project is licensed under the **MIT License**.

## 👤 Author
📝 **Murat (Mannu Baveja)**

---
💡 **For improvements or contributions, feel free to submit a pull request!** 🚀

