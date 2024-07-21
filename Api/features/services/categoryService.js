const {CategoryModel} = require('../models/category/category');

class CategoryService {
    constructor() {}

    async NewCategory(name, idProduct) {
        try {
            const acocunt = new CategoryModel({
                name, idProduct
            });
            await acocunt.save();
            return true;
        }
        catch(e) {
            return e;
        }
        return false;
    }

    async FindCategory(name) {
        try {
            var temp = await CategoryModel.findOne({name}).exec();
            return await CategoryModel.findOne({name}).exec();
        } 
        catch(e) {
            return res.status(500).send(e); 
        }
        return null;
    }

    async UpdateCategory(_id, updatedData) {
        try {
            const result = await CategoryModel.findByIdAndUpdate(_id, updatedData).exec();
            return result;
        } catch (e) {
            return e;
        }
    }

    async DeleteCategory(_id) {
        try {
            await CategoryModel.findByIdAndDelete(_id).exec();
            return true;
        } catch (e) {
            return e;
        }
    }
}
module.exports = CategoryService;