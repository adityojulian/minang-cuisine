const express = require("express");
const app = express();
const bodyParser = require("body-parser");

console.log("Server Start");

app.listen(3000);

app.use(express.urlencoded({ extended: true }));
app.use(bodyParser.json());

// app.use("/collect", require("./backend/routes/collectRoutes"));
app.use("/wallet", require("./backend/routes/walletRoutes"));
app.use("/recycler", require("./backend/routes/recyclerRoutes"));
app.use("/session", require("./backend/routes/sessionRoutes"));
app.use("/trash", require("./backend/routes/groceryItemsRoutes"));
