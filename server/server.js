const express = require("express");
const app = express();

console.log("Server Start");

app.use(express.urlencoded({ extended: true }));

// app.use("/collect", require("./backend/routes/collectRoutes"));
app.use("/wallet", require("./backend/routes/walletRoutes"));
