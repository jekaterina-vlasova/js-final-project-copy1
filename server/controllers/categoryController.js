const db = require('../db');

class CategoryController {

    async getAll(req, res) {
        db.query('SELECT * FROM category', (err, results) => {
            if (err) {
                console.error('Error fetching categories:', err);
                return res.status(500).json({ error: 'Error fetching categories' });
            }
            return res.json(results);
        });
    }
}

module.exports = new CategoryController();