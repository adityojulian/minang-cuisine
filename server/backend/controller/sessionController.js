const asyncHandler = require("express-async-handler");
const {
    addDoc,
    doc,
    query,
    getDocs,
    where,
    getDoc,
    updateDoc,
    deleteDoc,
} = require("firebase/firestore");
const {
    db,
    recycle_session,
    recycled_items,
    bought_items,
    unrecycled_items,
    batch,
} = require("../../database/firebase");
const { addItemtoInventory } = require("./trashBankController");
const { updatePoint } = require("./recyclerController");

const batchUpdate = async (items, session_id) => {
    for (const item of items) {
        await addDoc(recycled_items, {
            item_id: item.id,
            session_id: session_id,
            bought_id: item.bought_id,
        });
        await deleteDoc(doc(db, "bought_items", item.bought_id));
    }
    return;
};

// @desc Create Recycle session
// @route POST /create-session
// @access Private
const create = asyncHandler(async (req, res) => {
    const { items, user_id, location, points } = req.body;
    const session_body = {
        user_id: user_id,
        location: location,
    };
    const sessionSnapshot = await addDoc(recycle_session, session_body);
    const session_id = sessionSnapshot.id;
    batchUpdate(items, session_id)
        .then(addItemtoInventory(items, session_id))
        .then(updatePoint(user_id, points));
    res.json(session_id);
});

module.exports = {
    create,
};
