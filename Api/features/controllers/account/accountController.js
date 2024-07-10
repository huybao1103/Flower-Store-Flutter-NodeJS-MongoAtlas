const accountService = require("../../services/accountService");

class AccountController {
    constructor() {}

    async NewAccount(req, res) {
        return await accountService.NewAccount(req.name, req.email, req.phone, req.password);
    }
}
module.exports = AccountController;