// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitpulse/firebase/models/add_player_model.dart';

class FirebaseDataFunctions {
  static CollectionReference<AddPlayerDataModel> getPlayersCollection() {
    return FirebaseFirestore.instance
        .collection('Players')
        .withConverter<AddPlayerDataModel>(
      fromFirestore: (snapshot, _) {
        return AddPlayerDataModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static Future<void> addPlayerData(
      AddPlayerDataModel addPlayerDataModel, File file) async {
    try {
      var collection = getPlayersCollection();
      var docRef = collection.doc();
      addPlayerDataModel.id = docRef.id;

      if (addPlayerDataModel.imageUrl != null &&
          addPlayerDataModel.imageUrl!.isNotEmpty) {
        addPlayerDataModel.imageUrl =
            await convertImageToBase64(File(addPlayerDataModel.imageUrl!));
      }

      await docRef.set(addPlayerDataModel);
    } catch (e) {
      print("❌ Error adding player data: $e");
    }
  }

  static Future<QuerySnapshot<AddPlayerDataModel>> getPlayersData() {
    return getPlayersCollection()
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
  }

  static Future<String> convertImageToBase64(File imageFile) async {
    try {
      List<int> imageBytes = await imageFile.readAsBytes();
      return base64Encode(imageBytes);
    } catch (e) {
      print("❌ Error converting image to Base64: $e");
      return "";
    }
  }
}
