const express = require('express');
const mongoose = require('mongoose');

const app = express();
module.exports = {app};

const { ServerApiVersion } = require('mongodb');
const credentials = '/Users/thodo/Documents/Coding/HUFLIT/MobileNangCao/LT/FlowerStore/Flower-Store-Flutter-NodeJS-MongoAtlas/Api/Certificate/X509-cert-7353008439470924153.pem'

const client = mongoose.connect('mongodb+srv://testdb.tpyzpae.mongodb.net/FlowerDB?authSource=%24external&authMechanism=MONGODB-X509&retryWrites=true&w=majority&appName=TestDB', {
  tlsCertificateKeyFile: credentials,
  serverApi: ServerApiVersion.v1
})
.then(() => console.log('MongoDB connected'))
.catch(err => console.log(err));