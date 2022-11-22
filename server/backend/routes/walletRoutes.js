const express = require("express");
const router = express.Router();
const walletController = require("../controller/walletController");

// router.route("/create-wallet").post(walletController.create);
// router.route("/update-wallet").post(walletController.update);
router.route("/retrieve-wallet").post(walletController.retrieve);
// router.route("/transaction-wallet").post(walletController.transaction);
// router.route("/response-wallet").post(walletController.response);

module.exports = router;
