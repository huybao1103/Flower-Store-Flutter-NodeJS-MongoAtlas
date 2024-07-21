const {InvoiceModel} = require('../models/invoice/invoice');

class InvoiceService {
    constructor() {}

    async NewInvoice(detailinvoiceId,accountId) {
        try {
            const invoice = new InvoiceModel({
                detailinvoiceId,accountId
            });
            await invoice.save();
            return true;
        }
        catch(e) {
            return e;
        }
        return false;
    }

    async FindInvoice( accountId, res) {
        try {
            var temp = await InvoiceModel.findOne({ accountId}).exec();
            return await InvoiceModel.findOne({ accountId}).exec();
        } 
        catch(e) {
            return res.status(500).send(e); 
        }
        return null;
    }

    async UpdateInvoice(id, updateData) {
        try {
            const invoice = await InvoiceModel.findByIdAndUpdate(id, updateData, { new: true });
            return invoice;
        } catch (e) {
            return res.status(500).send(e); 
        }
    }

    async DeleteInvoice(id) {
        try {
            await InvoiceModel.findByIdAndDelete(id);
            return true;
        } catch (e) {
            return e;
        }
    }
    
    async GetInvoiceById(id) {
        try {
            const invoice = await InvoiceModel.findById(id).exec();
            return invoice;
        } catch (e) {
            return e;
        }
    }

    async GetAllInvoices() {
        try {
            const invoices = await InvoiceModel.find().exec();
            return invoices;
        } catch (e) {
            return e;
        }
    }

   

}
module.exports = InvoiceService;