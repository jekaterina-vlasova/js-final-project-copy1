const ApiErr = require('../error/ApiErr');
const db = require('../db');

class ProductController {
    async getAll(req, res, next) {
        try {
            let {category_id, brand_id, limit, page} = req.query;
            page = page || 1;
            limit = limit || 8;
            const offset = limit * (page - 1);

            let whereClause = '';

            if (brand_id) {
                whereClause = `WHERE brand_id = ${brand_id}`;
            }

            if (category_id) {
                whereClause += whereClause ? ` AND category_id = ${category_id}` : `WHERE category_id = ${category_id}`;
            }

 
            const getAllProductsQuery = `SELECT * FROM product ${whereClause} LIMIT ? OFFSET ?`;

            db.query(getAllProductsQuery, [parseInt(limit, 10), parseInt(offset, 10)], (err, results) => {
                if (err) {
                    return next(ApiErr.badRequest(err.message));
                }

                const products = results;

                return res.json(products);
            });
        } catch (err) {
            next(err); // Forward any unhandled errors to the error-handling middleware
        }
    }

    /*async getAll(req, res, next) {
        try {
            let {category_id, brand_id, limit, page} = req.query;
            page = page || 1;
            limit = limit || 4;
            const offset = limit * (page - 1);

            let whereClause = '';

            if (brand_id) {
                whereClause = `WHERE brand_id = ${brand_id}`;
            }

            if (category_id) {
                whereClause += whereClause ? ` AND category_id = ${category_id}` : `WHERE category_id = ${category_id}`;
            }

            const countQuery = `SELECT COUNT(*) as totalCount FROM product ${whereClause}`;
            const getAllProductsQuery = `SELECT * FROM product ${whereClause} LIMIT ? OFFSET ?`;

            db.query(countQuery, (err, countResult) => {
                if (err) {
                    return next(ApiErr.badRequest(err.message));
                }

                const totalCount = countResult[0].totalCount;

                db.query(getAllProductsQuery, [parseInt(limit, 10), parseInt(offset, 10)], (err, results) => {
                    if (err) {
                        return next(ApiErr.badRequest(err.message));
                    }

                    const products = results;

                    return res.json({ products, count: totalCount });
                });
            });
        } catch (err) {
            next(err);
        }
    }*/


    async getOne(req, res, next) {
        try {
            const { id } = req.params;
            const getProductQuery = `SELECT * FROM product WHERE id = ?`;
            db.query(getProductQuery, [id], (err, productResult) => {
                if (err) {
                    return next(ApiErr.badRequest(err.message));
                }

                const product = productResult[0];

                if (!product) {
                    return next(ApiErr.notFound('Product not found'));
                }

                return res.json(product);
            });
        } catch (err) {
            next(err);
        }
    }
}

module.exports = new ProductController();