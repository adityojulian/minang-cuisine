const express = require("express");
const router = express.Router();
const donationController = require("../controller/donationController");

router.route("/get-donation").get(donationController.getAll);

module.exports = router;
