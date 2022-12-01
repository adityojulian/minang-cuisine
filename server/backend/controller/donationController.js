const asyncHandler = require("express-async-handler");
const { db, batch, donation } = require("../../database/firebase");

const {
    addDoc,
    doc,
    query,
    getDocs,
    where,
    setDoc,
    updateDoc,
    runTransaction,
    getDoc,
} = require("firebase/firestore");

const getAll = asyncHandler(async (req, res) => {
    const snapshot = await getDocs(query(donation));
    const result = [];
    snapshot.forEach((e) => {
        result.push(e.data());
    });
    res.json(result);
});

module.exports = {
    getAll,
};
