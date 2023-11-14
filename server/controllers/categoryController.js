const db = require('../db');

class CategoryController {
    /*async create(req, res) {
        const { name } = req.body;
        db.query('INSERT INTO category (name) VALUES (?)', [name], (err, results) => {
            if (err) {
                console.error('Error creating category:', err);
                return res.status(500).json({ error: 'Error creating category' });
            }
            const category = { id: results.id, name };
            return res.json(category);
        });
    }*/

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