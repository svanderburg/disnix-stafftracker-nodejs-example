db.zipcodes.insert([
    { "zipcode": "2628CD", "street": "Mekelweg", "city": "Delft" },
    { "zipcode": "2628CN", "street": "Stevinweg", "city": "Delft" },
    { "zipcode": "2628CJ", "street": "Lorentzweg", "city": "Delft" },
    { "zipcode": "2628CE", "street": "Landbergstraat", "city": "Delft" },
    { "zipcode": "2628HS", "street": "Kluyverweg", "city": "Delft" }
]);

db.zipcodes.createIndex({ "zipcode": 1 });
