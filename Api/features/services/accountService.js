const {AccountModel} = require('../models/account/account');

class AccountService {
    constructor() {}

    async NewAccount(name, email, phone, password) {
        try {
            const acocunt = new AccountModel({
                name, email, password, phone
            });
            await acocunt.save();
            return true;
        }
        catch(e) {
            return e;
        }
        return false;
    }

    async Login(email, password, res) {
        try {
            var temp = await AccountModel.findOne({email, password}).exec();
            return await AccountModel.findOne({email, password}).exec();
        } 
        catch(e) {
            return res.status(500).send(e); 
        }
        return null;
    }
}
module.exports = AccountService;