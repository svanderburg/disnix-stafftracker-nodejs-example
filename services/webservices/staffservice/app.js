#!/usr/bin/env node

var slasp = require('slasp');
var express = require('express');
var bodyParser = require('body-parser');
var MongoClient = require('mongodb').MongoClient;
var ObjectId = require('mongodb').ObjectId;

var app = express();

// Parse JSON type as JSON
app.use(bodyParser.json({ type: 'application/json' }));

var url = process.env["STAFFDB_URL"] || 'mongodb://localhost:27017/staff';
var port = process.env["PORT"] || 3003;

// REST API URL routes

app.get('/staff', function(req, res) {
    var db;
    
    slasp.sequence([
        function(callback) {
            MongoClient.connect(url, callback);
        },
        
        function(callback, _db) {
            db = _db;
            db.collection('staff').find({}).toArray(callback);
        }
        
    ], function(err, staff) {
        if(err) {
            res.status(500).send(err);
        } else {
            res.send(staff);
        }
        
        if(!db) {
            db.close();
        }
    });
});

app.get('/staff/:id', function(req, res) {
    var id = req.params.id;
    var db;
    
    slasp.sequence([
        function(callback) {
            MongoClient.connect(url, callback);
        },
        
        function(callback, _db) {
            db = _db;
            db.collection('staff').find({ _id: ObjectId(id) }).toArray(callback);
        }
        
    ], function(err, staff) {
        if(err) {
            res.status(500).send(err);
        } else {
            if(staff.length > 0) {
                res.send(staff[0]);
            } else {
                res.status(404).send("Cannot find staff member!");
            }
        }
        
        if(!db) {
            db.close();
        }
    });
});

app.post('/staff', function(req, res) {
    var db;
    
    slasp.sequence([
        function(callback) {
            MongoClient.connect(url, callback);
        },
        
        function(callback, _db) {
            db = _db;
            db.collection('staff').insert({
                name: req.body.name,
                lastName: req.body.lastName,
                room: req.body.room,
                ipAddress: req.body.ipAddress
            }, callback);
        }
    ], function(err) {
        if(err) {
            res.status(500).send(err);
        } else {
            res.send();
        }
        
        if(!db) {
            db.close();
        }
    });
});

app.put('/staff/:id', function(req, res) {
    var id = req.params.id;
    var db;
    
    slasp.sequence([
        function(callback) {
            MongoClient.connect(url, callback);
        },
        
        function(callback, _db) {
            db = _db;
            db.collection('staff').update({ _id: ObjectId(id) }, { $set: {
                name: req.body.name,
                lastName: req.body.lastName,
                room: req.body.room,
                ipAddress: req.body.ipAddress
            } }, callback);
        }
    ], function(err, result) {
        if(err) {
            res.status(500).send(err);
        } else {
            if(result.result.n == 1) {
                res.send();
            } else {
                res.status(404).send();
            }
        }
        
        if(!db) {
            db.close();
        }
    });
});

app.delete('/staff/:id', function(req, res) {
    var id = req.params.id;
    var db;
    
    slasp.sequence([
        function(callback) {
            MongoClient.connect(url, callback);
        },
        
        function(callback, _db) {
            db = _db;
            db.collection('staff').remove({ _id: ObjectId(id) }, callback);
        }
    ], function(err, result) {
        if(err) {
            res.status(500).send(err);
        } else {
            if(result.result.n == 1) {
                res.send();
            } else {
                res.status(404).send();
            }
        }
        
        if(!db) {
            db.close();
        }
    });
});

// Start app server
app.listen(port);
