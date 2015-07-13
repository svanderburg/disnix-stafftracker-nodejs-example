#!/usr/bin/env node

var slasp = require('slasp');
var express = require('express');
var MongoClient = require('mongodb').MongoClient;
var ObjectId = require('mongodb').ObjectId;

var app = express();

var url = process.env["ROOMSDB_URL"] || 'mongodb://localhost:27017/rooms';
var port = process.env['PORT'] || 3001;

// REST API URL routes

app.get('/rooms', function(req, res) {
    var db;
    
    slasp.sequence([
        function(callback) {
            MongoClient.connect(url, callback);
        },
        
        function(callback, _db) {
            db = _db;
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
    var room = req.params.room;
    var db;
    
    slasp.sequence([
        function(callback) {
            MongoClient.connect(url, callback);
        },
        
        function(callback, _db) {
            db = _db;
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
});

// Start app server
app.listen(port);
