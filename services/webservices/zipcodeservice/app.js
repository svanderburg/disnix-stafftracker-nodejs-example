#!/usr/bin/env node

const slasp = require('slasp');
const express = require('express');
const { check, validationResult } = require('express-validator');
const MongoClient = require('mongodb').MongoClient;
const ObjectId = require('mongodb').ObjectId;

const app = express();

const url = process.env["ZIPCODESDB_URL"] || 'mongodb://localhost:27017';
const database = process.env["ZIPCODESDB_NAME"] || "zipcodes";
const port = process.env["PORT"] || 3002;

// REST API URL routes

app.get('/zipcodes', function(req, res) {
    let db;

    slasp.sequence([
        function(callback) {
            MongoClient.connect(url, callback);
        },

        function(callback, client) {
            db = client.db(database);
            db.collection('zipcodes').find({}).toArray(callback);
        }

    ], function(err, zipcodes) {
        if(err) {
            res.status(500).send(err);
        } else {
            res.send(zipcodes);
        }

        if(!db) {
            db.close();
        }
    });
});

app.get('/zipcodes/:zipcode', function(req, res) {
    // Check parameters
    check('zipcode', 'Invalid zipcode identifier').isLength({ min: 1 });

    const errors = validationResult(req);

    if(errors.isEmpty()) {
        // Query the data
        let db;

        slasp.sequence([
            function(callback) {
                MongoClient.connect(url, callback);
            },

            function(callback, client) {
                db = client.db(database);
                db.collection('zipcodes').find({ zipcode: req.params.zipcode }).toArray(callback);
            }

        ], function(err, zipcodes) {
            if(err) {
                res.status(500).send(err);
            } else {
                if(zipcodes.length > 0) {
                    res.send(zipcodes[0]);
                } else {
                    res.status(404).send("Cannot find zipcode!");
                }
            }

            if(!db) {
                db.close();
            }
        });
    } else {
        res.status(400).send(errors);
    }
});

// Start app server
app.listen(port);
