const express = require("express");
const app = express();

const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'cyf-ecommerce-api',
    password: '12345',
    port: 5432
});

// Endpoint to get all the customers.
app.get("/customers", function(req, res) {
    pool.query('SELECT * FROM customers', (error, result) => {
        res.json(result.rows);
    });
});

// Endpoint to get all the suppliers.
app.get("/suppliers", (req, res)=>{
    pool.query('SELECT * FROM suppliers', (error, result) => {
        res.json(result.rows);
    });
});

// Endpoint to get all the products  to load all the product names along with their supplier names.
app.get("/products", (req, res)=>{
    pool.query('select p.product_name, s.supplier_name  from products p inner join suppliers s on s.id  = p.supplier_id;', (error, result) => {
        res.json(result.rows);
    });
});



app.listen(3000, function() {
    console.log("Server is listening on port 3000. Ready to accept requests!");
});