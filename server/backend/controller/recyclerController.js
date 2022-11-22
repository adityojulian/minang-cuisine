const expressAsyncHandler = require("express-async-handler");
const { user } = require("../../database/firebase");
const { create_wallet } = require("./walletController");
import { setDoc, doc } from "firebase/firestore/lite";
const { makeRequest } = require("../utilities/utilities");

// Create User
// @desc Create new User
// @route POST /create-user
// @access Public
const create = expressAsyncHandler(async (req, res) => {
    try {
        const { first_name, last_name, unique_id, password, contact } =
            req.body;
        // REQ CREATE WALLET
        await setDoc(doc(user), unique_id),
            {
                first_name: first_name,
                last_name: last_name,
                password,
            };
    } catch (err) {
        res.json(err);
    }
});
