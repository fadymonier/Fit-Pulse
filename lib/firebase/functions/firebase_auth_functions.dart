// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitpulse/firebase/models/user_auth_model.dart';

class FirebaseAuthFunctions {
  static Future<void> createAccount(
      {required String name,
      required String email,
      required String password,
      required String phone,
      required String userName,
      required String gender,
      required Function onLoading,
      required Function onSuccess,
      required Function onError}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user!.sendEmailVerification();
      UserAuthModel userAuthModel = UserAuthModel(
        email: email,
        phone: phone,
        id: credential.user!.uid,
        name: userName,
        gender: gender,
      );
      addUser(userAuthModel);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);

        print('The account already exists for that email.');
      }
      onError(e.message);
    } catch (e) {
      onError(e.toString());

      print(e);
    }
  }

  static Future<void> signIn(String email, String password, Function onLoading,
      Function onSuccess, Function onError) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user!.emailVerified) {
        onSuccess();
      } else {
        onError("Please verify your account");
      }
      onLoading();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    }
  }

  static void resetPassword(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static CollectionReference<UserAuthModel> getUserAuthCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserAuthModel>(
          fromFirestore: (snapshot, _) =>
              UserAuthModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
  }

  static Future<void> addUser(UserAuthModel userAuthModel) {
    var collection = getUserAuthCollection();
    var docRef = collection.doc(userAuthModel.id);
    return docRef.set(userAuthModel);
  }

  static Future<UserAuthModel?> readUser() async {
    String id = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot<UserAuthModel> snap =
        await getUserAuthCollection().doc(id).get();
    return snap.data();
  }
}
