const AccountService = require("../../services/accountService");
const accountService = new AccountService();

class AccountController {
    constructor() {}

    async NewAccount(req, res) {
        return await accountService.NewAccount(req._id,req.name, req.email, req.phone, req.password);
    }

    async Login(req, res) {
        return await accountService.Login(req.email, req.password, res);
    }
}
module.exports = AccountController;