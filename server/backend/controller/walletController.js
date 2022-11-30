const asyncHandler = require("express-async-handler");
const makeRequest = require("../utilities/utilities").makeRequest;

// Create
// @desc Create new Wallet
// @route POST /create-wallet
// @access Private
const create = asyncHandler(async (req, res) => {
    try {
        const { first_name, last_name, unique_id, contact } = req.body;
        const body = {
            first_name: first_name,
            last_name: last_name,
            ewallet_reference_id: unique_id,
            type: "person",
            contact: contact,
        };
        const result = await makeRequest("POST", "/v1/user", body);
        res.json(result);
    } catch (err) {
        res.json(err);
    }
});

async function create_wallet(body) {
    console.log(body);
    const result = await makeRequest("POST", "/v1/user", body);
    console.log(result);
    return result;
}

// Update
// @desc Update existing wallet information
// @route POST /update-wallet
// @access Private
const update = asyncHandler(async (req, res) => {
    try {
        const { id, ref_id, parameter } = req.body;
        const body = {
            ewallet: id,
            ewallet_reference_id: ref_id,
            parameter,
        };
        const result = await makeRequest("POST", "/v1/user", body);
        res.json(result);
    } catch (err) {
        res.json(err);
    }
});

// Retrieve
// @desc Retrieve wallet information
// @route Post /retrieve-wallet
// @access Private
const retrieve = asyncHandler(async (req, res) => {
    try {
        console.log(req.body);
        const { id } = req.body;
        const result = await makeRequest("GET", `/v1/user/${id}`);
        res.json(result);
    } catch (err) {
        res.json(err);
    }
});

// Transaction
// @desc Conduct transaction between two wallet
// @route Post /transaction-wallet
// @access Private
const transaction = asyncHandler(async (req, res) => {
    try {
        const { source_id, dest_id, amount, currency } = req.body;
        const body = {
            source_ewallet: source_id,
            amount: amount,
            currency: currency,
            destination_ewallet: dest_id,
        };
        const result = await makeRequest("POST", "/v1/account/transfer", body);
        res.json(result);
    } catch (err) {
        res.json(err);
    }
});

const transactionFunc = async (body) => {
    try {
        const result = await makeRequest("POST", "/v1/account/transfer", body);
        console.log(result);
        return result;
    } catch (err) {
        return err;
    }
};

// Response
// @desc Respond to transaction
// @route POST /response-wallet
// @access Private
const response = asyncHandler(async (req, res) => {
    try {
        const { id, response } = req.body;
        const result = await makeRequest(
            "POST",
            "/v1/account/transfer/response",
            body
        );
        res.json(result);
    } catch (err) {
        res.json(err);
    }
});
const responseFunc = async (body) => {
    const result = await makeRequest(
        "POST",
        "/v1/account/transfer/response",
        body
    );
    return result.body.data.status;
};

module.exports = {
    create,
    create_wallet,
    update,
    transaction,
    transactionFunc,
    retrieve,
    response,
    responseFunc,
};
