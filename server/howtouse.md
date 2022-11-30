Create User:
    > Firestore Collection:
        users
    > Desc:
        Buat user profile untuk naroh points dan ewallet id
    > url post request:
        http://localhost:3000/recycler/create-user
    > Example post body:
        {
            "first_name":"Sadikin",
            "last_name":"Sukinah",
            "unique_id": uid, -> INI NNTI JADI UID FIREBASE
            "contact":{
                "contact_type":"personal", -> INI GAUSAH DIUBAH
                "first_name":"Sadikin",
                "last_name":"Sukinah",
                "email":"sadikin@gmail.com",
                "country":"GB",
                "nationality":"GB",
                "date_of_birth":"12/01/1998"
        }
    > Flow:
        1. User sign up trus dapet uid hasil dari auto generated firebase
        2. Langsung post request aja pake body kayak diatas
        (usahain di step 2 gausah ganti state jadi sekalian aja dalam satu function)
    > Output:
        {"F4QzMxZtO3Wve4QcHLsa"}

Scan item trus masuk ke inventory:
    > Firestore Collection:
        grocery_items
        bought_items
    > Desc:
        User scan barcode, dapet item description, trus nambahin ke item inventory
    > url Post request:
        - ambil item description: 
        - tambah ke inventory: http://localhost:3000/recycler/new-items
    > Example post body:

        - ambil item desc:
        {
            "items": [
                "7979"
            ]
        }

        - tambah ke inventory:
        {
            "items": [
                {
                    "id": "7979", 
                    "user_id":"F4QzMxZtO3Wve4QcHLsa"
                }
            ]
        }
    > Flow:
        1. dari api barcode scanner nge-scan barcode dapet hasil id itemnya
        2. jalanin post request untuk ngambil item desc pake id dari barcode scanner, tampilin di frontend
        3. tunggu prompt dari user untuk jadi recycle ato nggak
        4. kalo iya jalanin post request pake body kaya di example
    > Output:
        - ambil item description:

        - tambah ke inventory: Output nya ga guna lgsung aja kasi page success


Kegiatan recycling:
    > Firestore collection:
        - bought_items
        - recycled_items
        - recycle_session
        - trash_bank_inventory
    > Desc:
        Dari user inventory -> pilih item yang mau direcycle -> recycle -> summary -> confirm -> pilih location -> finish session 
    > URL:
        - ambil item yang ada di inventory: http://localhost:3000/recycler/get-info
        - finish session: http://localhost:3000/session/create-session
    > Example Body:
        *ambil inventory:
        {
            "id":"F4QzMxZtO3Wve4QcHLsa" -> user id
        }


        *finish session:
        {
            "user_id": "F4QzMxZtO3Wve4QcHLsa",
            "items": [
                {
                    "id": "7979",
                    "bought_id": "9aUq0pXuCdii5N0UQ6yT"
                }
            ],
            "location":"Selly Hill Road"
        }
    > Flow:
        1. masuk page inventory post request pake user id, tampilin di frontend
        2. user pilih item trus pencet recycle
        3. frontend ngitung total weight, sama points
        4. user confirm
        5. masuk sistem gps itu lanjutin aja sampe akhir, dari server blom ada apa apa
        6. user buang sampah trus confirm, post request ke finish session pake body kayak diatas
    > Output:
        - ambil inventory:
            [
                {
                    "weight": 0.8,
                    "recycle": true,
                    "material": "plastic",
                    "name": "Nivea Men Shampoo",
                    "id": "12376",
                    "type": "tube"
                },
                {
                    "material": "cardboard",
                    "name": "Aspro Soya Milk",
                    "weight": "0.9",
                    "type": "Container",
                    "id": "23385",
                    "recycle": "true"
                },

            ]
        
        - finish session:
            gaguna