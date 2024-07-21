const {app} = require('./app');
const bodyParser = require('body-parser');
const port = 3000;

const accountRoutes = require('./features/routes/accountRoutes');
const categoryRoutes = require('./features/routes/categoryRoutes');


app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());

app.use('/Accounts', accountRoutes);
app.use('/Categories', categoryRoutes);

app.listen(port, () => {
    console.log(`Server is listening on port: http://localhost:${port}`);
});