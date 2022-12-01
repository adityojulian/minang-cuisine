const {
    addDoc,
    doc,
    query,
    getDocs,
    where,
    getDoc,
    updateDoc,
} = require("firebase/firestore");

const { db, location } = require("../../database/firebase");

const asyncHandler = require("express-async-handler");

const getLocation = asyncHandler(async (req, res) => {
    try {
        const { id } = req.body;
        const result = await getDoc(doc(db, "location", id));
        const res_id = result.id;
        const res_data = result.data();
        res.json({ id: res_id, data: res_data });
    } catch (err) {
        res.json(err);
    }
});

const getLocations = asyncHandler(async (req, res) => {
    const snapshot = await getDocs(query(location));
    const result = [];
    snapshot.forEach((e) => {
        const id = e.id;
        const data = e.data();
        result.push({ id: id, data: data });
    });
    res.json(result);
});

module.exports = {
    getLocation,
    getLocations,
};
