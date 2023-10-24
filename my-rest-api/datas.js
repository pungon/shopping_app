const mysql = require('mysql2');

const pool = mysql.createPool({
    host: '192.168.1.158',
    user: 'root',
    password: '1234',
    database: 'shoping'
});

function getProducts(callback) {
    pool.query('SELECT * FROM product ;', 
    callback);
}

function userData(callback) {
    pool.query('SELECT * FROM users ;', 
    callback);
}

// function getProductAndStore(callback) {
//     pool.query('SELECT store.id AS store_id,store.Store_name,store.Rate_the_store,store.Description AS store_description,store.imageProfile_url AS store_profile_url,store.imageCover_url AS store_cover_url,product.product_id,product.product_name,product.Category,product.detail,product.cost,product.quantitySold,product.discount,product.rate,product.transportPrice,product.image1_url,product.image2_url,product.image3_url,product.image4_url FROM store INNER JOIN product ON store.id = product.store_id;', 
//     callback);
// }

function getProductAndStore(condition, callback) {
    const sql = `SELECT * FROM store WHERE ${condition}`;
    pool.query(sql, callback);
}

function test2(condition, callback) {
    const sql = `SELECT * FROM store WHERE ${condition}`;
    pool.query(sql, callback);
}


module.exports = {
    test2,
    getProducts,
    getProductAndStore,
    userData
};