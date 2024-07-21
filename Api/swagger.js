// Swagger
const swaggerAutogen = require('swagger-autogen')();
const swaggerUi = require('swagger-ui-express');

const { app } = require('./app');

// Schemas
const {AccountSchemaDoc} = require('./features/models/account/account');
const {CategorySchemaDoc} = require('./features/models/category/category');


const doc = {
    info: {
        title: 'Flower Store API',
        description: ''
    },
    host: 'localhost:3000',
    definitions: {
        Accounts: AccountSchemaDoc,
        Login: { email: 'string', password: 'string' },
        Categories: CategorySchemaDoc,
        FindCategory: { name: 'string'},
        DeleteCategory: { id: 'string'},
        UpdateCategory: {
            name: 'string', 
            idProduct: 'string' 
        }
    },
};

const outputFile = './swagger-output.json';
const routes = ['./features/routes/accountRoutes','./features/routes/categoryRoutes'];

swaggerAutogen(outputFile, routes, doc).then(() => {
    require("./index");

    const swaggerDocument = require('./swagger-output.json');
    var options = {
        explorer: true
    };
    app.use('/api-docs', swaggerUi.serve);
    app.get('/api-docs', swaggerUi.setup(swaggerDocument, options));
});


