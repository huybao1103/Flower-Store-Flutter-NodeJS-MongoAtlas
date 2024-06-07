const app = require('./app');
const bodyParser = require('body-parser');
const port = 3000;

const taskRoutes = require('./features/controllers/task/routes');

app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());

app.use('/Tasks', taskRoutes);

app.get('/', (req, res) => {
    res.send('Hello World');
});

app.listen(port, () => {
    console.log(`Server is listening on port: http://localhost:${port}`);
});