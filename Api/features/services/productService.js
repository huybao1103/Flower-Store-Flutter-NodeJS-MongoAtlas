const {ProductModel} = require('../models/product/product');

class ProductService {
    constructor() {}

    async NewProduct( nameProduct, price, img,quantity,descrip,cateid,inclueId) {
        try {
            const product = new ProductModel({
                 nameProduct, price, img,quantity,descrip,cateid,inclueId
            });
            await product.save();
            return true;
        }
        catch(e) {
            return e;
        }
        return false;
    }

    async FindProduct( nameProduct, res) {
        try {
            var temp = await ProductModel.findOne({ nameProduct}).exec();
            return await ProductModel.findOne({ nameProduct}).exec();
        } 
        catch(e) {
            return res.status(500).send(e); 
        }
        return null;
    }

    async UpdateProduct(id, updateData) {
        try {
            const product = await ProductModel.findByIdAndUpdate(id, updateData, { new: true });
            return product;
        } catch (e) {
            return res.status(500).send(e); 
        }
    }

    async DeleteProduct(id) {
        try {
            await ProductModel.findByIdAndDelete(id);
            return true;
        } catch (e) {
            return e;
        }
    }
    
    async GetProductById(id) {
        try {
            const product = await ProductModel.findById(id).exec();
            return product;
        } catch (e) {
            return e;
        }
    }

    async GetAllProducts(ids) {
        try {
            const products = ids != null && ids instanceof Array
            ? await ProductModel.find({ _id: { $in: ids }}).exec() 
            : await ProductModel.find().exec();
            return products;
        } catch (e) {
            return e;
        }
    }

    async GetProductFavorite() {
        try {
          const favoriteProducts = await ProductModel.find({ fav: true }).exec();
          return favoriteProducts;
        } catch (e) {
          throw new Error(e);
        }
      }
    async toggleFavorite(id, isFavorite) {
        try {
            const product = await ProductModel.findByIdAndUpdate(
                id,
                { fav: isFavorite },
                { new: true }
            ).exec();
            return product;
        } catch (e) {
            throw new Error('Không thể cập nhật trạng thái yêu thích: ' + e.message);
        }
    }

}
module.exports = ProductService;