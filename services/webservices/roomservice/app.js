#!/usr/bin/env node

var slasp = require('slasp');
var express = require('express');
var expressValidator = require('express-validator');
var MongoClient = require('mongodb').MongoClient;
var ObjectId = require('mongodb').ObjectId;

var app = express();

// Use the express validator middleware
app.use(expressValidator());

var url = process.env["ROOMSDB_URL"] || 'mongodb://localhost:27017';
var database = process.env["ROOMSDB_NAME"] || "rooms"
var port = process.env['PORT'] || 3001;

// REST API URL routes

app.get('/rooms', function(req, res) {
    var db;
    
    slasp.sequence([
        function(callback) {
            MongoClient.connect(url, callback);
        },
        
        function(callback, client) {
            db = client.db(database);
            db.collection('rooms').find({}).toArray(callback);
        }
        
    ], function(err, rooms) {
        if(err) {
            res.status(500).send(err);
        } else {
            res.send(rooms);
        }
        
        if(!db) {
            db.close();
        }
    });
});

app.get('/rooms/:room', function(req, res) {
    // Check parameters
    req.checkParams('room', 'Invalid room identifier').notEmpty();
    
    var errors = req.validationErrors();
    
    if(errors) {
        res.status(400).send(errors);
    } else {
        // Query the data
        var room = req.params.room;
        var db;
    
        slasp.sequence([
            function(callback) {
                MongoClient.connect(url, callback);
            },
            
            function(callback, client) {
                db = client.db(database);
                db.collection('rooms').find({ room: room }).toArray(callback);
            }
            
        ], function(err, rooms) {
            if(err) {
                res.status(500).send(err);
            } else {
                if(rooms.length > 0) {
                    res.send(rooms[0]);
                } else {
                    res.status(404).send("Cannot find room!");
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
