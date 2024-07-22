const DetailInvoiceService = require("../../services/detailInvoiceService");
const detailInvoiceService = new DetailInvoiceService();

class DetailInvoiceController {
    constructor() {}

    async NewDetailInvoice(req, res) {
        return await detailInvoiceService.NewDetailInvoice( req.productId,req.price,req.quantity,req.address,req.date);
    }

  

    async UpdateDetailInvoice(req, res) {
        const { id } = req.params;
        const updateData = req.body;
        return await detailInvoiceService.UpdateDetailInvoice(id, updateData);
       
    }

    async DeleteDetailInvoice(req, res) {     
        const { id } = req.params;
        return await detailInvoiceService.DeleteDetailInvoice(id);
    }

    async GetDetailInvoiceById(req, res) {
        const { id } = req.params;
        return  await detailInvoiceService.GetDetailInvoiceById(id);
        
    }

    async GetAllDetailInvoices(req, res) {
        return await detailInvoiceService.GetAllDetailInvoices();
        
    }
}
module.exports = DetailInvoiceController;