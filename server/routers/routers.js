const Router = require('express');
const router = new Router();
const clientRouter = require('./clientRouter');
const productRouter = require('./productRouter');
const categoryRouter = require('./categoryRouter');
const brandRouter = require('./brandRouter');

router.use('/client', clientRouter);
router.use('/product', productRouter);
router.use('/category', categoryRouter);
router.use('/brand', brandRouter);

module.exports = router;