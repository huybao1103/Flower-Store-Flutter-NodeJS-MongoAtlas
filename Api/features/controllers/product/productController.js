const ProductService = require("../../services/productService");
const productService = new ProductService();

class ProductController {
    constructor() {}

    async NewProduct(req, res) {
        return await productService.NewProduct( req.nameProduct, req.price, req.img,req.quantity,req.descrip,req.cateid,req.inclueId);
    }

    async FindProduct(req, res) {
        return await productService.FindProduct(req.nameProduct, res);
    }

    async UpdateProduct(req, res) {
        const { id } = req.params;
        const updateData = req.body;
        return await productService.UpdateProduct(id, updateData);
    }

    async DeleteProduct(req, res) {
        
        const { id } = req.params;
        
        return await productService.DeleteProduct(id);
    }

    async GetProductById(req, res) {
        const { id } = req.params;
        return await productService.GetProductById(id);
    }

    async GetAllProducts(req, res) {
        return await productService.GetAllProducts();
    }
}
module.exports = ProductController;