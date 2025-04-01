// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BountyBoard {
    
    // Struct to store task details
    struct Task {
        string description;
        uint reward;
        address payable assignee;
        bool completed;
    }
    
    // Mapping to store tasks
    mapping(uint => Task) public tasks;
    
    // Counter for task IDs
    uint public taskCount;
    
    // Event for task creation
    event TaskCreated(uint taskId, string description, uint reward);
    
    // Event for task completion
    event TaskCompleted(uint taskId, address assignee);
    
    // Event for reward distribution
    event RewardDistributed(uint taskId, address assignee, uint reward);

    // Create a new task (owner will assign tasks)
    function createTask(string memory _description, uint _reward) public {
        taskCount++;
        tasks[taskCount] = Task({
            description: _description,
            reward: _reward,
            assignee: payable(address(0)),
            completed: false
        });

        emit TaskCreated(taskCount, _description, _reward);
    }

    // Assign a task to a user (no input fields for assignment, owner can do this manually)
    function assignTask(uint _taskId, address payable _assignee) public {
        require(_taskId <= taskCount, "Task does not exist");
        require(tasks[_taskId].assignee == address(0), "Task already assigned");
        tasks[_taskId].assignee = _assignee;
    }

    // Mark a task as completed
    function completeTask(uint _taskId) public {
        require(_taskId <= taskCount, "Task does not exist");
        require(tasks[_taskId].assignee == msg.sender, "You are not the assignee");
        require(!tasks[_taskId].completed, "Task already completed");
        
        tasks[_taskId].completed = true;
        emit TaskCompleted(_taskId, msg.sender);
    }

    // Distribute reward after completion
    function distributeReward(uint _taskId) public {
        require(_taskId <= taskCount, "Task does not exist");
        require(tasks[_taskId].completed, "Task not completed yet");
        require(tasks[_taskId].assignee != address(0), "No assignee for this task");
        
        address payable assignee = tasks[_taskId].assignee;
        uint reward = tasks[_taskId].reward;
        
        // Transfer the reward to the assignee
        assignee.transfer(reward);
        
        emit RewardDistributed(_taskId, assignee, reward);
    }

    // Fund the contract with ETH to distribute rewards
    function fundContract() public payable {}
}
