module.exports = {
    logger: function (req, res, next) {
        console.log(new Date().toString() + ' - ' + req.method + ' - ' + req.originalUrl);
        next();
    }
};
