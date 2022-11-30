const express = require("express");
const router = express.Router();
const groceryItemsController = require("../controller/groceryItemsController");

router.route("/get-data").post(groceryItemsController.getItemDesc);

module.exports = router;
