const express = require("express");
const router = express.Router();
const recyclerController = require("../controller/recyclerController");

router.route("/create-user").post(recyclerController.create);
router.route("/new-items").post(recyclerController.newItems);
router.route("/get-items").post(recyclerController.getItems);
router.route("/get-info").post(recyclerController.getInformation);
router.route("/points-to-money").post(recyclerController.transaction);
router
    .route("/confirm-transaction")
    .post(recyclerController.confirmTransaction);
router.route("/add-item").post(recyclerController.addItemAction);
// router.route("/start-session".post(recyclerController.start_session));
module.exports = router;
