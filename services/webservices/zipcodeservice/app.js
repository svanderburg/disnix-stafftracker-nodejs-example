#!/usr/bin/env node

var slasp = require('slasp');
var express = require('express');
var expressValidator = require('express-validator');
var MongoClient = require('mongodb').MongoClient;
var ObjectId = require('mongodb').ObjectId;

var app = express();

// Use the express validator middleware
app.use(expressValidator());

var url = process.env["ZIPCODESDB_URL"] || 'mongodb://localhost:27017/zipcodes';
var port = process.env["PORT"] || 3002;

// REST API URL routes

app.get('/zipcodes', function(req, res) {
    var db;
    
    slasp.sequence([
        function(callback) {
            MongoClient.connect(url, callback);
        },
        
        function(callback, _db) {
            db = _db;
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
    req.checkParams('zipcode', 'Invalid zipcode identifier').notEmpty();
    
    var errors = req.validationErrors();
    
    if(errors) {
        res.status(400).send(errors);
    } else {
        // Query the data
        var zipcode = req.params.zipcode;
        var db;
        
        slasp.sequence([
            function(callback) {
                MongoClient.connect(url, callback);
            },
            
            function(callback, _db) {
                db = _db;
                db.collection('zipcodes').find({ zipcode: zipcode }).toArray(callback);
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
    }
});

// Start app server
app.listen(port);
