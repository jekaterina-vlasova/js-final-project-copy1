const Router = require('express');
const router = new Router();
const brandController = require('../controllers/brandController');

router.get('/', brandController.getAll);

module.exports = router;