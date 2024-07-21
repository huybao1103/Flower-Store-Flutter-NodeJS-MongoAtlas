const InvoiceService = require("../../services/invoiceService");
const invoiceService = new InvoiceService();

class InvoiceController {
    constructor() {}

    async NewInvoice(req, res) {
        return await invoiceService.NewInvoice( req.detailinvoiceId,req.accountId);
    }

    async FindInvoice(req, res) {
        return await invoiceService.FindInvoice(req.accountId, res);
    }

    async UpdateInvoice(req, res) {
        const { id } = req.params;
        const updateData = req.body;
        return await invoiceService.UpdateInvoice(id, updateData);
       
    }

    async DeleteInvoice(req, res) {     
        const { id } = req.params;
        return await invoiceService.DeleteInvoice(id);
    }

    async GetInvoiceById(req, res) {
        const { id } = req.params;
        return  await invoiceService.GetInvoiceById(id);
        
    }

    async GetAllInvoices(req, res) {
        return await invoiceService.GetAllInvoices();
        
    }
}
module.exports = InvoiceController;