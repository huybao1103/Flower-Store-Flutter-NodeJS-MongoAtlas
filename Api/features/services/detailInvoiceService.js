const {DetailInvoiceModel} = require('../models/invoice/detailInvoice');

class DetailInvoiceService {
    constructor() {}

    async NewDetailInvoice(productId,price,quantity,address,date) {
        try {
            const detailInvoice = new DetailInvoiceModel({
                productId,price,quantity,address,date
            });
            await detailInvoice.save();
            return true;
        }
        catch(e) {
            return e;
        }
        return false;
    }



    async UpdateDetailInvoice(id, updateData) {
        try {
            const detailInvoice = await DetailInvoiceModel.findByIdAndUpdate(id, updateData, { new: true });
            return detailInvoice;
        } catch (e) {
            return res.status(500).send(e); 
        }
    }

    async DeleteDetailInvoice(id) {
        try {
            await DetailInvoiceModel.findByIdAndDelete(id);
            return true;
        } catch (e) {
            return e;
        }
    }
    
    async GetDetailInvoiceById(id) {
        try {
            const detailInvoice = await DetailInvoiceModel.findById(id).exec();
            return detailInvoice;
        } catch (e) {
            return e;
        }
    }

    async GetAllDetailInvoices() {
        try {
            const detailInvoices = await DetailInvoiceModel.find().exec();
            return detailInvoices;
        } catch (e) {
            return e;
        }
    }

   

}
module.exports = DetailInvoiceService;