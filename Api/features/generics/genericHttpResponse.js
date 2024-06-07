class GenericHttpResponse {
    constructor() {}

    response(res, value, isSuccess = true) {
        return isSuccess ? res.status(200).send(value) : res.status(500).send(value);
    }
}
module.exports = GenericHttpResponse;