db.rooms.insert([
    { "room": "EWI 01.01", "zipcode": "2628CD" },
    { "room": "EWI 01.02", "zipcode": "2628CD" },
    { "room": "EWI 01.03", "zipcode": "2628CD" },
    { "room": "EWI 01.04", "zipcode": "2628CD" },
    { "room": "CITG 01.01", "zipcode": "2628CN" },
    { "room": "CITG 01.02", "zipcode": "2628CN" },
    { "room": "CITG 01.03", "zipcode": "2628CN" },
    { "room": "CITG 01.04", "zipcode": "2628CN" },
    { "room": "TNW 01.01", "zipcode": "2628CJ" },
    { "room": "TNW 01.02", "zipcode": "2628CJ" },
    { "room": "TNW 01.03", "zipcode": "2628CJ" },
    { "room": "TNW 01.04", "zipcode": "2628CJ" },
    { "room": "IO 01.01", "zipcode": "2628CE" },
    { "room": "IO 01.02", "zipcode": "2628CE" },
    { "room": "IO 01.03", "zipcode": "2628CE" },
    { "room": "IO 01.04", "zipcode": "2628CE" },
    { "room": "LNR 01.01", "zipcode": "2628HS" },
    { "room": "LNR 01.02", "zipcode": "2628HS" },
    { "room": "LNR 01.03", "zipcode": "2628HS" },
    { "room": "LNR 01.04", "zipcode": "2628HS" }
]);

db.rooms.createIndex({ "room": 1 });
