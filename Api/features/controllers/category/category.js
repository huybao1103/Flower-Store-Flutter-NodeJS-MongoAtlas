const CategoryService = require("../../services/categoryService");
const categoryService = new CategoryService();

class CategoryController {
    constructor() {}

    async NewCategory(req, res) {
        return await categoryService.NewCategory(req.name, req.email, req.phone, req.password);
    }

    async FindCategory(req, res) {
        return await categoryService.FindCategory(req.name, res);
    }
    
    async UpdateCategory(req, res) {
        const updatedData = req.body;
        return await categoryService.UpdateCategory(req._id, updatedData, res);
    }

    async DeleteCategory(req, res) {
        return await categoryService.DeleteCategory(req._id, res);
    }
}
module.exports = CategoryController;