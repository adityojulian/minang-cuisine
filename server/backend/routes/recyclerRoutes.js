const express = require("express");
const router = express.Router();
const recyclerController = require("../controller/recyclerController");

router.route("/create-user").post(recyclerController.create);
// router.route("/start-session".post(recyclerController.start_session));
module.exports = router;
