const { Schema, model } = require('mongoose');

const InvoiceSchemaDoc = {
    
    $detailinvoiceId: 'string',
    $accountId: 'string',

    
}

const InvoiceSchema = new Schema({
    
    detailinvoiceId: { type: String, required: true },      
    accountId: { type: String, required: true },
    
})


const InvoiceModel = model('Invoice', InvoiceSchema);
module.exports = { InvoiceSchemaDoc, InvoiceModel };