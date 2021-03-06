#!/usr/bin/env node

const path = require('path');
const slasp = require('slasp');
const express = require('express');
const { check, validationResult } = require('express-validator');
const bodyParser = require('body-parser');
const client = require('./client.js');

const app = express();

// Configure express to use ejs as template engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, "views"));

// Parse submitted form data as JSON
app.use(bodyParser.urlencoded({ extended: false }));

// The static/ folder contains files that must be statically served
app.use(express.static(path.join(__dirname, 'static')));

// Determine port number to listen on
const port = process.env["PORT"] || 3000;

// Dynamic URL routes

app.get('/', function(req, res) {
    client.fetchAllStaff(function(err, staff) {
        if(err) {
            res.status(500).send("Cannot retrieve staff records: "+err);
        } else {
            res.render('index', { staff: staff });
        }
    });
});

app.get('/displaystaff/:id', function(req, res) {
    let staffMember;

    slasp.sequence([
        function(callback) {
            client.findStaffMember(req.params.id, callback);
        },

        function(callback, _staffMember) {
            staffMember = _staffMember;
            client.findRoom(staffMember.room, callback);
        },

        function(callback, room) {
            client.findZipcode(room.zipcode, callback);
        }
    ], function(err, zipcode) {
        if(err) {
            res.status(500).send("Cannot retrieve staff record: "+err);
        } else {
            res.render('displaystaff', {
                staffMember: staffMember,
                zipcode: zipcode
            });
        }
    });
});

app.get('/editstaff', function(req, res) {
    client.fetchAllRooms(function(err, rooms) {
        if(err) {
            res.status(500).send("Cannot retrieve rooms: "+err);
        } else {
            res.render('editstaff', {
                rooms: rooms
            });
        }
    });
});

app.get('/editstaff/:id', function(req, res) {
    let staffMember;

    slasp.sequence([
        function(callback) {
            client.findStaffMember(req.params.id, callback);
        },

        function(callback, _staffMember) {
            staffMember = _staffMember;
            client.fetchAllRooms(callback);
        }
    ], function(err, rooms) {
        if(err) {
            res.status(500).send("Cannot retrieve staff record: "+err);
        } else {
            res.render('editstaff', {
                staffMember: staffMember,
                rooms: rooms
            });
        }
    });
});

app.get('/modifystaff', function(req, res) {
    const action = req.query.action;

    if(action == "delete") {
        client.deleteStaffMember(req.query.id, function(err) {
            if(err) {
                res.status(404).send("Cannot delete staff member: "+err);
            } else {
                res.redirect("/");
            }
        });
    } else {
        res.status(500).send("Unknown action: "+action);
    }
});

app.post('/modifystaff', function(req, res) {
    const action = req.body.action;

    const staffMember = {
        name: req.body.name,
        lastName: req.body.lastName,
        room: req.body.room,
        ipAddress: req.body.ipAddress
    };

    if(action == "insert") {
        client.insertStaffMember(staffMember, function(err) {
            if(err) {
                res.status(404).send("Cannot insert staff member: "+err);
            } else {
                res.redirect("/");
            }
        });
    } else if(action == "update") {
        var id = req.body._id;

        client.updateStaffMember(id, staffMember, function(err) {
            if(err) {
                res.status(404).send("Cannot update staff member: "+err);
            } else {
                res.redirect("/");
            }
        });
    } else {
        res.status(500).send("Unknown action: "+action);
    }
});

// Start the app server
app.listen(port);
