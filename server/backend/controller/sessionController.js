const asyncHandler = require("express-async-handler");
const {
    addDoc,
    doc,
    query,
    getDocs,
    where,
    getDoc,
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

// @desc Create Recycle session
// @route POST /create-session
// @access Private
const create = asyncHandler(async (req, res) => {
    try {
        const { items, user_id, location } = req.body;
        const session_body = {
            user_id: user_id,
            location: location,
        };
        const sessionSnapshot = await addDoc(recycle_session, session_body);
        const session_id = sessionSnapshot.id;
        console.log(session_id);
        items.forEach((item) => {
            batch.set(doc(recycled_items), {
                item_id: item.id,
                session_id: session_id,
                bought_id: item.bought_id,
            });
            batch.delete(doc(db, "bought_items", item.bought_id));
        });
        await batch.commit();
        const invent = await addItemtoInventory(items, session_id);
        res.json(session_id);
    } catch (err) {
        res.json(err);
    }
});

module.exports = {
    create,
};
