const express = require("express");
const router = express.Router();
const groceryItemsController = require("../controller/groceryItemsController");

router.route("/get-data").post(groceryItemsController.getItemDesc);
router.route("/new-items").post(groceryItemsController.addItems);

module.exports = router;
