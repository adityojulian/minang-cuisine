const express = require("express");
const router = express.Router();
const locationController = require("../controller/locationController");

router.route("/get-location").post(locationController.getLocation);
router.route("/all-locations").get(locationController.getLocations);

module.exports = router;
