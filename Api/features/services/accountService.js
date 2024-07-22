const {AccountModel} = require('../models/account/account');

class AccountService {
    constructor() {}

    async NewAccount(_id, name, email, phone, password) {
        try {
            if(_id != null) {
                return await AccountModel.findByIdAndUpdate(_id, {name, email, phone, password}).exec();
            }
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
            var doc = await AccountModel.findOne({email: email, password: password}).exec();
            
            return await AccountModel.findOne({email, password}).exec();
        } 
        catch(e) {
            return res.status(500).send(e); 
        }
        return null;
    }
}
module.exports = AccountService;