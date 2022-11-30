const express = require("express");
const router = express.Router();
const sessionController = require("../controller/sessionController");

router.route("/create-session").post(sessionController.create);

module.exports = router;
