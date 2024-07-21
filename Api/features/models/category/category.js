const { Schema, model } = require('mongoose');

const CategorySchemaDoc = {
    $_id: 'string',
    $name: 'string',
    $idProduct: 'string',
}

const CategorySchema = new Schema({
    _id: { type: String, required: true },
    name: { type: String, required: true },
    idProduct: { type: String, required: true }
})

const CategoryModel = model('Categories', CategorySchema);
module.exports = { CategorySchemaDoc, CategoryModel };