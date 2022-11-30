const {
    addDoc,
    doc,
    query,
    getDocs,
    where,
    getDoc,
    updateDoc,
} = require("firebase/firestore");

const { grocery_items } = require("../../database/firebase");

const asyncHandler = require("express-async-handler");

const resolvepromises = async (ids) => {
    let results = [];
    for (const id of ids) {
        const query_id = id;
        const item_query = query(grocery_items, where("id", "==", query_id));
        const item_desc = await getDocs(item_query);
        results.push(item_desc.docs[0].data());
    }
    return results;
};

const getItemDesc = asyncHandler(async (req, res) => {
    try {
        const { ids } = req.body;
        resolvepromises(ids).then((results) => {
            res.json(results);
        });
    } catch (err) {
        res.json(err);
    }
});

module.exports = {
    getItemDesc,
};
