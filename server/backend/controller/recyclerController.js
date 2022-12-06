const asyncHandler = require("express-async-handler");
const {
    db,
    batch,
    user,
    bought_items,
    grocery_items,
    trash_bank_inventory,
} = require("../../database/firebase");
const { addItemsFunc } = require("./groceryItemsController");
const {
    create_wallet,
    transactionFunc,
    responseFunc,
    retrieveFunc,
} = require("./walletController");
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

// @desc Create new User and wallet
// @route POST /create-user
// @access Public
const create = asyncHandler(async (req, res) => {
    try {
        console.log("parameter sign up " + req.body);
        const { first_name, last_name, unique_id, password, contact } =
            req.body;
        // REQ CREATE WALLET
        const wallet_body = {
            first_name: first_name,
            last_name: last_name,
            ewallet_reference_id: unique_id,
            type: "person",
            contact: contact,
        };
        const wallet = await create_wallet(wallet_body);
        const newuser_body = {
            first_name: first_name,
            last_name: last_name,
            password: password,
            points: 0,
            ewallet: wallet.body.data.id,
        };
        const docRef = await setDoc(doc(db, "users", unique_id), newuser_body);
        res.json(docRef.id);
    } catch (err) {
        res.json(err);
    }
});

// @desc Put new items to user's inventory
// @route POST /new-items
// @access Private
const batchUpdate = async (items, session_id) => {
    for (const item of items) {
        await addDoc(bought_items, {
            item_id: item.id,
            user_id: item.user_id,
        });
    }
    return true;
};

const newItems = asyncHandler(async (req, res) => {
    try {
        const { items } = req.body;
        batchUpdate(items);
        res.json(items);
    } catch (err) {
        res.json(err);
    }
});

// @desc Get items from bought item inventory
// @route POST /get-items
// @access Private
// Function for promise handling
const resolvepromises = async (item_ids) => {
    let results = [];
    for (const id of item_ids) {
        const bought_id = id.id;
        const query_id = id.data().item_id;
        const item_query = query(grocery_items, where("id", "==", query_id));
        const item_desc = await getDocs(item_query);
        console.log(item_desc);
        data = item_desc.docs[0].data();
        data["bought_id"] = bought_id;
        results.push(data);
    }
    return results;
};
const getItems = asyncHandler(async (req, res) => {
    try {
        const { id } = req.body;
        const q = query(bought_items, where("user_id", "==", id));

        const querySnapshot = await getDocs(q);
        resolvepromises(querySnapshot.docs).then((results) =>
            res.json(results)
        );
    } catch (err) {
        res.json(err);
    }
});

// @desc grab user information
// @route POST /get-information
// @access Private
const getInformation = asyncHandler(async (req, res) => {
    const { id } = req.body;
    const result = await getDoc(doc(db, "users", id));
    const data = result.data();
    const wallet = await retrieveFunc(data.ewallet);
    data["balance"] = wallet;
    res.json(data);
});

// @desc transaction to money by points
// @route POST /points-to-money
// @access Private
const transaction = asyncHandler(async (req, res) => {
    const { recycler_ewallet, points } = req.body;
    const money = points / 100;
    console.log(money);
    const body = {
        // MASIH HARDCODE TOLONG TAROH DI ENVIRONMENT BESOK BESOK
        source_ewallet: "ewallet_1cec7972ebf3cd15c0c440a61992c729",
        amount: money,
        currency: "GBP",
        destination_ewallet: recycler_ewallet,
    };
    const result = await transactionFunc(body);
    res.json(result.body.data.id);
});

// @desc confirm transaction
// @route POST /confirm-transaction
// @access Private
const confirmTransaction = asyncHandler(async (req, res) => {
    const { id, response, user_id, points } = req.body;
    const body = {
        id: id,
        status: response,
    };
    const result = await responseFunc(body);
    if (result == "CLO") {
        const userRef = doc(db, "users", user_id);
        await runTransaction(db, async (transaction) => {
            const userDoc = await transaction.get(userRef);
            if (!userDoc.exists()) {
                throw "User not exists!";
            }
            const newPoints = userDoc.data().points - points;
            if (newPoints < 0) {
                return Promise.reject("No Sufficient Points");
            }
            transaction.update(userRef, { points: newPoints });
            return res.json("success");
        });
    } else {
        res.json("rejected");
    }
});

const updatePoint = async (id, points) => {
    const userRef = doc(db, "users", id);
    await runTransaction(db, async (transaction) => {
        const userDoc = await transaction.get(userRef);
        if (!userDoc.exists()) {
            throw "User not exists";
        }
        const newPoints = userDoc.data().points + points;
        const response = transaction.update(userRef, { points: newPoints });
        console.log(response);
    });
};

const addItemAction = asyncHandler(async (req, res) => {
    try {
        const { user_id, items } = req.body;
        await addItemsFunc(items);
        await updatePoint(user_id, 1);
        res.json("success");
    } catch (err) {
        res.json(err);
    }
});

module.exports = {
    create,
    newItems,
    getItems,
    getInformation,
    transaction,
    confirmTransaction,
    updatePoint,
    addItemAction,
};
