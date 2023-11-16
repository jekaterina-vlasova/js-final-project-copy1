const ApiErr = require('../error/ApiErr');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const db = require('../db');

const generateJwt = (id, email) => {
    return jwt.sign(
        {id, email},
        process.env.SECRET_KEY,
        {expiresIn: '48h'}
    );
}
class ClientController {
    async registration(req, res, next) {
        const {email, password} = req.body;
        if (!email || !password) {
            return next(ApiErr.badRequest('Please, fill in all fields'));
        }

        // Check if the user with the same email exists
        const checkClientQuery = `SELECT * FROM client WHERE email = ?`;
        db.query(checkClientQuery, [email], (err, results) => {
            if (err) {
                return next(ApiErr.internal('Error while checking email'));
            }

            if (results.length > 0) {
                return next(ApiErr.badRequest('This email is alredy registered'));
            }

            // If the client does not exist, proceed to create a new client
            bcrypt.hash(password, 5, (err, hashPassword) => {
                if (err) {
                    return next(ApiErr.internal('Error while hashing password'));
                }
                const createClientQuery = `INSERT INTO client (email, password) VALUES (?, ?)`;
                db.query(createClientQuery, [email, hashPassword], (err, result) => {
                    if (err) {
                        return next(ApiErr.internal('Error while creating new client'));
                    }

                    // Obtain the client_id from the result
                    const client_id = result.insertId; 

                    // Create a cart for the client
                    const createCartQuery = `INSERT INTO cart (client_id) VALUES (?)`;
                    db.query(createCartQuery, [client_id], (err, cartResult) => {
                        if (err) {
                            return next(ApiErr.internal('Error while creating the cart'));
                        }

                        // Generate JWT token and send the response
                        const token = generateJwt(client_id, email); 
                        return res.json({ token });
                    });
                });
            });
        });
    }

    async login(req, res, next) {
        const {email, password} = req.body;
        const checkClientQuery = `SELECT * FROM client WHERE email = ?`;
        db.query(checkClientQuery, [email], (err, results) => {
            if (err) {
                return next(ApiErr.internal('Error while login existing client'));
            }

            if (results.length == 0) {
                return next(ApiErr.internal('Client does not exist'));
            }

            const client = results[0];
            bcrypt.compare(password, client.password, (err, comparePassword) => {
                if (err || !comparePassword) {
                    return next(ApiErr.internal('Password is wrong'));
                }

                const token = generateJwt(client.id, client.email);
                return res.json({token});
            });
        });
    }

    async check(req, res, next) {
    const token = generateJwt(req.client.id, req.client.email);
        return res.json({token});
    }
}

module.exports = new ClientController();