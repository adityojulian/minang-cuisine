const asyncHandler = require("express-async-handler");

const makeRequest = require("../utilities/utilities").makeRequest;

const createPayment = asyncHandler(async (req, res) => {
    const { amount, receiver } = req.body;
    const body = {
        amount: amount,
        currency: "GBP",
        ewallets: [
            {
                ewallet: receiver,
                percentage: 100,
            },
        ],
    };
    const result = await makeRequest("POST", "/v1/payments", body);
    res.json(result.body.data.id);
});

const completePayment = asyncHandler(async (req, res) => {
    const { token } = req.body;
    const body = {
        token: token,
    };
    const result = await makeRequest(
        "POST",
        "/v1/payments/completePayment",
        body
    );
});

module.exports = {
    createPayment,
    completePayment,
};
