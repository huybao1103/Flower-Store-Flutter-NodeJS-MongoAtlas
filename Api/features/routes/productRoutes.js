const ProductController = require("../controllers/product/productController");

const GenericHttpResponse = require('../generics/genericHttpResponse');
const express = require('express');
const router = express.Router();

const productController = new ProductController();
const genericHttpResponse = new GenericHttpResponse();

router.get('/find-product',async(req,res)=>{
    /*  
        #swagger.tags = ['Product']
        #swagger.parameters['body'] = {
            in: 'body',
            description: 'Find product',
            schema: { $ref: '#/definitions/FindProduct' }
        } 
        #swagger.responses[200] = { description: 'Find success ', schema: {$ref: '#/definitions/Products'} }
        #swagger.responses[500] = { description: 'Find Fail', schema: 'error' }
    */
})
router.post('/get-product', async (req, res) => {
    /*  
        #swagger.tags = ['Product']
        #swagger.parameters['body'] = {
            in: 'body',
            description: 'Add new Product.',
            schema: { $ref: '#/definitions/Products' }
        } 
        #swagger.responses[200] = { description: 'New Products Success', schema: true }
    */
    var result = await productController.NewProduct(req.body, res);
    if(result === true) genericHttpResponse.success(res, true);
    else genericHttpResponse.fail(res, result);
});

router.put('/update-product/:id', async (req, res) => {
    /*  
        #swagger.tags = ['Product']
        #swagger.parameters['body'] = {
            in: 'body',
            description: 'Update Product.',
            schema: { $ref: '#/definitions/Products' }
        } 
        #swagger.responses[200] = { description: 'Update Products Success', schema: true }
    */
    var result = await productController.UpdateProduct(req, res);
    if(result) genericHttpResponse.success(res, result);
    else genericHttpResponse.fail(res, result);
});

router.delete('/delete-product/:id', async (req, res) => {
    /*  
        #swagger.tags = ['Product']
        #swagger.parameters['id'] = {
            in: 'path',
            description: 'Delete Product by ID.',
        } 
        #swagger.responses[200] = { description: 'Delete Products Success', schema: true }
    */
    var result = await productController.DeleteProduct(req, res);
    if(result === true) genericHttpResponse.success(res, true);
    else genericHttpResponse.fail(res, result);
});

router.get('/getbyid-product/:id', async (req, res) => {
    /*  
        #swagger.tags = ['Product']
        #swagger.parameters['id'] = {
            in: 'path',
            description: 'Get Product by ID.',
        } 
        #swagger.responses[200] = { description: 'Get Product Success', schema: { $ref: '#/definitions/Products' } }
    */
    var result = await productController.GetProductById(req, res);
    if(result) genericHttpResponse.success(res, result);
    else genericHttpResponse.fail(res, result);
});

router.post('/getall-product', async (req, res) => {
    /*  
        #swagger.tags = ['Product']
        #swagger.parameters['ids'] = {
            in: 'path',
            description: 'Get Product by list of IDs.',
        }
        #swagger.responses[200] = { description: 'Get All Products Success', schema: { $ref: '#/definitions/Products' } }
    */
    var result = await productController.GetAllProducts(req.body, res);
    if(result) genericHttpResponse.success(res, result);
    else genericHttpResponse.fail(res, result);
});

module.exports = router;