const {app} = require('./app');
const bodyParser = require('body-parser');
const port = 3000;

const accountRoutes = require('./features/routes/accountRoutes');
const productRoutes = require('./features/routes/productRoutes');
const invoiceRoutes = require('./features/routes/invoiceRoutes.js');
const detailInvoiceRoutes = require('./features/routes/detailInvoiceRoutes.js');


app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());

app.use('/Accounts', accountRoutes);
app.use('/Product', productRoutes);
app.use('/api/Invoice', invoiceRoutes);
app.use('/api/DetailInvoice', detailInvoiceRoutes);

app.listen(port, () => {
    console.log(`Server is listening on port: http://localhost:${port}`);
});