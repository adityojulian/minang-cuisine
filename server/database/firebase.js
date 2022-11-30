const { initializeApp } = require("firebase/app");
const { getFirestore, collection } = require("firebase/firestore");
const { writeBatch } = require("firebase/firestore");
const firebaseConfig = {
    apiKey: "AIzaSyAO35lWt4hLx4oTFE3IWUHjYDwExTv6DZk",
    authDomain: "pickles-9090e.firebaseapp.com",
    projectId: "pickles-9090e",
    storageBucket: "pickles-9090e.appspot.com",
    messagingSenderId: "97939368238",
    appId: "1:97939368238:web:fe92f208bcd1cbbed8b2bf",
    measurementId: "G-3HEP9EB2BT",
};

const fb = initializeApp(firebaseConfig);
const db = getFirestore(fb);
const batch = writeBatch(db);

// ITEMS
const grocery_items = collection(db, "grocery_items");

// RECYCLER
const user = collection(db, "users");
// RECYCLER RECYCLE SESSION
const recycle_session = collection(db, "recycle_session");
const bought_items = collection(db, "bought_items");
const recycled_items = collection(db, "recycled_items");
const unrecycled_items = collection(db, "unrecycled_items");
// RECYCLER TRANSACTION
const transaction_to_money = collection(db, "transaction_to_money");
const transaction_to_donation = collection(db, "transaction_to_donation");

// TRASH_BANK
const trash_bank = collection(db, "trash_bank");
const trash_bank_inventory = collection(db, "trash_bank_inventory");

// COMPANY
const user_company = collection(db, "user_company");
// COMPANY TRANSACTION
const transaction_recycle_session = collection(
    db,
    "transaction_recycle_session"
);
const transaction_recycle_inventory = collection(
    db,
    "transaction_recycle_inventory"
);

// DONATION
const donation = collection(db, "donation");

module.exports = {
    db,
    batch,
    grocery_items,
    user,
    recycle_session,
    recycled_items,
    bought_items,
    unrecycled_items,
    transaction_to_donation,
    transaction_to_money,
    user_company,
    transaction_recycle_inventory,
    transaction_recycle_session,
    trash_bank,
    trash_bank_inventory,
    donation,
};
