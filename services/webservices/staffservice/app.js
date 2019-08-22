#!/usr/bin/env node

const slasp = require('slasp');
const express = require('express');
const { check, validationResult } = require('express-validator');
const bodyParser = require('body-parser');
const MongoClient = require('mongodb').MongoClient;
const ObjectId = require('mongodb').ObjectId;

const app = express();

// Parse JSON type as JSON
app.use(bodyParser.json({ type: 'application/json' }));

const url = process.env["STAFFDB_URL"] || 'mongodb://localhost:27017';
const database = process.env["STAFFDB_NAME"] || "staff";
const port = process.env["PORT"] || 3003;

// REST API URL routes

app.get('/staff', function(req, res) {
    let db;

    slasp.sequence([
        function(callback) {
            MongoClient.connect(url, callback);
        },

        function(callback, client) {
            db = client.db(database);
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
    // Check parameters
    check('id', 'Invalid identifier').isLength({ min: 1 });

    const errors = validationResult(req);

    if(errors.isEmpty()) {
        let db;

        slasp.sequence([
            function(callback) {
                MongoClient.connect(url, callback);
            },

            function(callback, client) {
                db = client.db(database);
                db.collection('staff').find({ _id: ObjectId(req.params.id) }).toArray(callback);
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
    } else {
        res.status(400).send(errors);
    }
});

app.post('/staff', function(req, res) {
    let db;

    slasp.sequence([
        function(callback) {
            MongoClient.connect(url, callback);
        },

        function(callback, client) {
            db = client.db(database);
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
    // Check parameters
    check('id', 'Invalid identifier').isLength({ min: 1 });

    const errors = validationResult(req);

    if(errors.isEmpty()) {
        let db;

        slasp.sequence([
            function(callback) {
                MongoClient.connect(url, callback);
            },

            function(callback, client) {
                db = client.db(database);
                db.collection('staff').update({ _id: ObjectId(req.params.id) }, { $set: {
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
    } else {
        res.status(400).send(errors);
    }
});

app.delete('/staff/:id', function(req, res) {
    // Check parameters
    check('id', 'Invalid identifier').isLength({ min: 1 });

    const errors = validationResult(req);

    if(errors.isEmpty()) {
        let db;

        slasp.sequence([
            function(callback) {
                MongoClient.connect(url, callback);
            },

            function(callback, client) {
                db = client.db(database);
                db.collection('staff').remove({ _id: ObjectId(req.params.id) }, callback);
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
    } else {
        res.status(400).send(errors);
    }
});

// Start app server
app.listen(port);
