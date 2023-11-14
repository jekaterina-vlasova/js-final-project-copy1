const db = require('../db');

class BrandController {
    /*async create(req, res) {
        const { name } = req.body;
        db.query('INSERT INTO Brand (name) VALUES (?)', [name], (err, results) => {
            if (err) {
                console.error('Error creating brand:', err);
                return res.status(500).json({ error: 'Error creating brand' });
            }
            const brand = { id: results.insertId, name };
            return res.json(brand);
        });
    }*/

    async getAll(req, res) {
        db.query('SELECT * FROM brand', (err, results) => {
            if (err) {
                console.error('Error fetching brands:', err);
                return res.status(500).json({error: 'Error fetching brands'});
            }
            return res.json(results);
        });
    }
}

module.exports = new BrandController();