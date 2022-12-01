const asyncHandler = require("express-async-handler");
const makeRequest = require("../utilities/utilities").makeRequest;

const payout = asyncHandler(async (req, res) => {
    try {
        const { beneficiary, sender, payout_amount, ewallet } = req.body;
        const body = {
            beneficiary: beneficiary,
            beneficiary_entity_type: "individual",
            beneficiary_country: "GB",
            beneficiary_currency: "GBP",
            sender: sender,
            sender_entity_type: "individual",
            ewallet: ewallet,
            sender_country: "GB",
            sender_currency: "GBP",
            payout_amount: payout_amount,
            payout_currency: "GBP",
            payout_method_type: "gb_general_bank",
        };
        const result = await makeRequest("POST", "/v1/payouts", body);
        res.json(result);
    } catch (err) {
        res.json(err);
    }
});

const getPayoutDetails = asyncHandler(async (req, res) => {
    try {
        const result = await makeRequest(
            "GET",
            "/v1/payouts/gb_general_bank/details?beneficiary_country=gb&beneficiary_entity_type=company&payout_amount=251&payout_currency=gbp&sender_country=gb&sender_currency=gbp&sender_entity_type=individual"
        );
        res.json(result.body);
    } catch (err) {
        res.json(err);
    }
    //     const result = await makeRequest(
    //         "GET",
    //         "/v1/payouts/supported_types?category=bank&payout_currency=gbp"
    //     );
    //     console.log({ result });
});

module.exports = {
    payout,
    getPayoutDetails,
};

// {
//     "status": {
//         "error_code": "",
//         "status": "SUCCESS",
//         "message": "",
//         "response_code": "",
//         "operation_id": "18357bbc-0a17-4af9-8bb6-8df9acb4e87c"
//     },
//     "data": {
//         "payout_method_type": "gb_general_bank",
//         "sender_currency": "GBP",
//         "sender_country": "*",
//         "sender_entity_type": "individual",
//         "beneficiary_country": "gb",
//         "payout_currency": "GBP",
//         "beneficiary_entity_type": "individual",
//         "is_cancelable": 1,
//         "is_location_specific": 0,
//         "is_expirable": 0,
//         "minimum_expiration_seconds": null,
//         "maximum_expiration_seconds": null,
//         "is_online": null,
//         "image": "/checkout/gb_general_bank.png",
//         "status": 1,
//         "beneficiary_required_fields": [
//             {
//                 "name": "first_name",
//                 "regex": "^[-a-zA-Z0-9?:().,'+ /]{1,35}$",
//                 "is_required": true,
//                 "type": "string"
//             },
//             {
//                 "name": "last_name",
//                 "regex": "^[-a-zA-Z0-9?:().,'+ /]{1,35}$",
//                 "is_required": true,
//                 "type": "string"
//             },
//             {
//                 "name": "account_number",
//                 "regex": "[A-Za-z0-9]{1,34}",
//                 "is_required": true,
//                 "type": "string"
//             },
//             {
//                 "name": "sort_code",
//                 "regex": "([0-9]){6}",
//                 "is_required": true,
//                 "type": "string"
//             }
//         ],
//         "sender_required_fields": [
//             {
//                 "name": "first_name",
//                 "regex": "[-a-zA-Z0-9?:().,'+ /]+",
//                 "is_required": true,
//                 "type": "string"
//             },
//             {
//                 "name": "last_name",
//                 "regex": "[-a-zA-Z0-9?:().,'+ /]+",
//                 "is_required": true,
//                 "type": "string"
//             }
//         ],
//         "payout_options": [],
//         "minimum_amount": null,
//         "maximum_amount": null,
//         "batch_file_header": "payout_method_type,sender_currency,payout_currency,beneficiary.first_name,beneficiary.last_name,beneficiary.account_number,beneficiary.sort_code,sender.first_name,sender.last_name"
//     }
// }
