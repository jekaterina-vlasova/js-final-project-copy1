const ApiErr = require('../error/ApiErr');

module.exports = function (err, req, res, next) {
    if (err instanceof ApiErr) {
        return res.status(err.status).json({message: err.message});
    }
    return res.status(500).json({message: "Unexpected error!"});
}