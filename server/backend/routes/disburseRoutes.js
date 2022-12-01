const express = require("express");
const router = express.Router();
const disburseController = require("../controller/disburseController");

router.route("/payoutInfo").get(disburseController.getPayoutDetails);
router.route("/payout").post(disburseController.payout);

module.exports = router;
