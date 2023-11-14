const Router = require('express');
const router = new Router();
const clientRouter = require('./clientRouter');
//const cartRouter = require('./cartRouter');
//const cart_productRouter = require('./cart_productRouter');
const productRouter = require('./productRouter');
//const product_reviewRouter = require('./product_reviewRouter');
const categoryRouter = require('./categoryRouter');
const brandRouter = require('./brandRouter');

router.use('/client', clientRouter);
//router.use('/cart', cartRouter);
//router.use('/cart_product', cart_productRouter);
router.use('/product', productRouter);
//router.use('/product_review', product_reviewRouter);
router.use('/category', categoryRouter);
router.use('/brand', brandRouter);

module.exports = router;