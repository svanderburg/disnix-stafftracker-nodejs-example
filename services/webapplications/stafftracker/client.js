var Client = require('node-rest-client').Client;
var client = new Client();

var staffServiceURL = process.env.STAFFSERVICE_URL || "http://localhost:3003";
var zipcodeServiceURL = process.env.ZIPCODESERVICE_URL || "http://localhost:3002";
var roomServiceURL = process.env.ROOMSERVICE_URL || "http://localhost:3001";

function fetchAllStaff(callback) {
    client.get("http://localhost:3003/staff", function(data, response) {
        callback(null, JSON.parse(data));
    });
}

exports.fetchAllStaff = fetchAllStaff;

function findStaffMember(id, callback) {
    client.get(staffServiceURL+"/staff/"+encodeURIComponent(id), function(data, response) {
        callback(null, JSON.parse(data));
    });
}

exports.findStaffMember = findStaffMember;

function deleteStaffMember(id, callback) {
    client.delete(staffServiceURL+"/staff/"+encodeURIComponent(id), function(data, response) {
        callback(null);
    });
}

exports.deleteStaffMember = deleteStaffMember;

function updateStaffMember(id, staffMember, callback) {
    var args = {
        data: staffMember,
        headers: { "Content-Type": "application/json" }
    };
    
    client.put(staffServiceURL+"/staff/"+encodeURIComponent(id), args, function(data, response) {
        callback(null);
    });
}

exports.updateStaffMember = updateStaffMember;

function insertStaffMember(staffMember, callback) {
    var args = {
        data: staffMember,
        headers: { "Content-Type": "application/json" }
    };
    
    client.post(staffServiceURL+"/staff", args, function(data, response) {
        callback(null);
    });
}

exports.insertStaffMember = insertStaffMember;

function fetchAllZipcodes(callback) {
    client.get(zipcodeServiceURL+"/zipcodes", function(data, response) {
        callback(null, JSON.parse(data));
    });
}

exports.fetchAllZipcodes = fetchAllZipcodes;

function findZipcode(id, callback) {
    client.get(zipcodeServiceURL+"/zipcodes/"+encodeURIComponent(id), function(data, response) {
        callback(null, JSON.parse(data));
    });
}

exports.findZipcode = findZipcode;

function fetchAllRooms(callback) {
    client.get(roomServiceURL+"/rooms", function(data, response) {
        callback(null, JSON.parse(data));
    });
}

exports.fetchAllRooms = fetchAllRooms;

function findRoom(id, callback) {
    client.get(roomServiceURL+"/rooms/"+encodeURIComponent(id), function(data, response) {
        callback(null, JSON.parse(data));
    });
}

exports.findRoom = findRoom;
