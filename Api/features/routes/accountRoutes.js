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
    if(await accountController.NewAccount(req.body, res)) genericHttpResponse.response(res, value);
    else genericHttpResponse.response(res, 'Error save task', false);
});


router.get('/test', (req,res) => {
    // #swagger.tags = ['Accounts']
    res.send('Test');
})
module.exports = router;