const {app} = require('./app');
const bodyParser = require('body-parser');
const port = 3000;

const accountRoutes = require('./features/routes/accountRoutes');
const productRoutes = require('./features/routes/productRoutes');


app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());

app.use('/Accounts', accountRoutes);
app.use('/Product', productRoutes);

app.listen(port, () => {
    console.log(`Server is listening on port: http://localhost:${port}`);
});