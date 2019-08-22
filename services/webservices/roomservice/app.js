#!/usr/bin/env node

const slasp = require('slasp');
const express = require('express');
const { check, validationResult } = require('express-validator');
const MongoClient = require('mongodb').MongoClient;
const ObjectId = require('mongodb').ObjectId;

const app = express();

const url = process.env["ROOMSDB_URL"] || 'mongodb://localhost:27017';
const database = process.env["ROOMSDB_NAME"] || "rooms"
const port = process.env['PORT'] || 3001;

// REST API URL routes

app.get('/rooms', function(req, res) {
    let db;

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
    check('room', 'Invalid room identifier').isLength({ min: 1 });

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
                db.collection('rooms').find({ room: req.params.room }).toArray(callback);
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
    } else {
        res.status(400).send(errors);
    }
});

// Start app server
app.listen(port);
