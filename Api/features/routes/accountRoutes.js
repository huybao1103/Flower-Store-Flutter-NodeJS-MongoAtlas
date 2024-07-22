const AccountController = require("../controllers/account/accountController");

const GenericHttpResponse = require('../generics/genericHttpResponse');
const express = require('express');
const router = express.Router();

const accountController = new AccountController();
const genericHttpResponse = new GenericHttpResponse();


router.post('/signup', async (req, res) => {
    /*  
        #swagger.tags = ['Accounts']
        #swagger.parameters['body'] = {
            in: 'body',
            description: 'Add new user.',
            schema: { $ref: '#/definitions/Accounts' }
        } 
        #swagger.responses[200] = { description: 'Sign up success', schema: true }
    */
    var result = await accountController.NewAccount(req.body, res);
    if(result === true) genericHttpResponse.success(res, true);
    else genericHttpResponse.fail(res, result);
});


router.post('/login', async (req,res) => {
    /*  
        #swagger.tags = ['Accounts']
        #swagger.parameters['body'] = {
            in: 'body',
            description: 'Login.',
            schema: { $ref: '#/definitions/Login' }
        } 
        #swagger.responses[200] = { description: 'Login success', schema: { $ref: '#/definitions/Accounts' } }
        #swagger.responses[500] = { description: 'Login failt', schema: 'error' }
    */
    var result = await accountController.Login(req.body, res);
    return genericHttpResponse.success(res, result);
})
module.exports = router;