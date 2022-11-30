const {
    addDoc,
    doc,
    query,
    getDocs,
    where,
    getDoc,
    updateDoc,
} = require("firebase/firestore");

const {
    grocery_items,
    trash_bank_inventory,
    db,
} = require("../../database/firebase");

// @desc Add new items to trash_bank inventory
// @route NONE
// @access SYSTEM-ONLY
const addItemtoInventory = async (items, trash_bank_id) => {
    console.log({ items, trash_bank_id });
    for (const item of items) {
        // QUERY FOR ITEM DESCRIPTION
        const item_query = query(grocery_items, where("id", "==", item.id));
        const item_desc = await getDocs(item_query);

        // QUERY FOR TOTAL WEIGHT OF ITEM IN INVENTORY
        const type = item_desc.docs[0].data().type;
        const material = item_desc.docs[0].data().material;
        const weight = item_desc.docs[0].data().weight;
        const query_inventory = query(
            trash_bank_inventory,
            where("trash_bank_id", "==", trash_bank_id),
            where("type", "==", `${type}_${material}`)
        );
        const snapshot = await getDocs(query_inventory);
        // Check if exist
        if (snapshot.docs.length == 0) {
            const result = addDoc(trash_bank_inventory, {
                type: `${type}_${material}`,
                amount: weight,
                trash_bank_id: trash_bank_id,
            });
        } else {
            const item_ref = doc(
                db,
                "trash_bank_inventory",
                snapshot.docs[0].id
            );
            const result = await updateDoc(item_ref, {
                amount: snapshot.docs[0].data().amount + weight,
            });
        }
    }
    return true;
};

module.exports = {
    addItemtoInventory,
};
