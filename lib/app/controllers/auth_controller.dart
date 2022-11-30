import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pickles_rapyd/app/data/auth_provider.dart';
import 'package:pickles_rapyd/app/models/UserModel.dart';
import 'package:pickles_rapyd/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  User? user;

  void signin(String email, String password) async {
    try {
      print(email);
      print(password);
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (auth.currentUser != null) {
        user = userCredential.user;
        // await user!.updateDisplayName(name);
        await user!.reload();
        user = auth.currentUser;
        print("username: " + user!.displayName.toString());
        Get.offAllNamed(Routes.DASHBOARD);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signup(String name, String email, String password) async {
    try {
      print(name);
      print(email);
      print(password);
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (auth.currentUser != null) {
        user = userCredential.user;
        await user!.updateDisplayName(name);
        await user!.reload();
        user = auth.currentUser;

        print("uid " + user!.uid);

        var userForDb = UserModel(
            firstName: name,
            lastName: name,
            uniqueId: user!.uid,
            password: password,
            contact: Contact(
                firstName: name,
                lastName: name,
                contactType: "personal",
                email: email,
                country: "GB",
                nationality: "GB",
                dateOfBirth: "12/02/2002"));

        // userForDb.firstName = name;
        // print(userForDb.firstName);
        // userForDb.lastName = name;
        // print(userForDb.lastName);
        // userForDb.uniqueId = user!.uid;
        // print(userForDb.uniqueId);
        // userForDb.password = password;
        // print(userForDb.password);

        print("user buat db: " + userForDb.toJson().toString());

        // userForDb.contact!.contactType = "personal";
        // print(userForDb.contact!.contactType);
        // userForDb.contact!.firstName = name;
        // userForDb.contact!.lastName = name;
        // userForDb.contact!.email = email;
        // userForDb.contact!.country = "GB";
        // userForDb.contact!.nationality = "GB";
        // userForDb.contact!.dateOfBirth = "12/02/2002";
        // // userForDb!.password = password;

        // print("user buat db: " + userForDb.toJson().toString());

        await AuthProvider().registerUser(userForDb);

        print("username: " + user!.displayName.toString());
        Get.offAllNamed(Routes.DASHBOARD);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
