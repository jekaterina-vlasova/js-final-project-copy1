const db = require('../db');

class BrandController {

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