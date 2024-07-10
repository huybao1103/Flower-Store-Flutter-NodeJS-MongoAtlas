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
            console.log(e);
        }
        return false;
    }
}
module.exports = AccountService;