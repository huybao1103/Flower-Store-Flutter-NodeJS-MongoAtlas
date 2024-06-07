const { Collection } = require('mongoose');
const TaskModel = require('../models/task');

class TaskService {
    constructor() {}
    async getList() {
        const result = TaskModel.collection;
        return TaskModel.collection.find({}).toArray();
    }

    async save(id, taskName, status) {
        console.log(id + ' ' + taskName);
        try {
            if(id) {
                const model = await TaskModel.findByIdAndUpdate(id, {name: taskName, status: status}).exec();
                if(model != null) return await TaskModel.findById(id).exec();
            }
            else {
                const tasks = new TaskModel
                (
                  {
                    name: taskName,
                    createdDate: new Date(),
                    status: status
                  }
                );
                await tasks.save();
                return tasks;
            }
        } 
        catch(e) {
            console.log(e);
        }

    }
}
module.exports = TaskService;