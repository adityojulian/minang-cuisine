const express = require("express");
const router = express.Router();
const collectController = require("../controller/collectController");

router.route("/create-payment").post(collectController.createPayment);
router.route("/complete-payment").post(collectController.completePayment);

module.exports = router;
