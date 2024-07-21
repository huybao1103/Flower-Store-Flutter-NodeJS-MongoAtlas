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
        const result = await productService.UpdateProduct(id, updateData);
        if (result) {
            return res.status(200).json(result);
        } else {
            return res.status(500).send("Error updating product");
        }
    }

    async DeleteProduct(req, res) {
        
        const { id } = req.params;
        
        return await productService.DeleteProduct(id);
    }

    async GetProductById(req, res) {
        const { id } = req.params;
        const result = await productService.GetProductById(id);
        if (result) {
            return res.status(200).json(result);
        } else {
            return res.status(500).send("Product not found");
        }
    }

    async GetAllProducts(req, res) {
        const result = await productService.GetAllProducts();
        if (result) {
            return res.status(200).json(result);
        } else {
            return res.status(500).send("Error fetching products");
        }
    }
}
module.exports = ProductController;