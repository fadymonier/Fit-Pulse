// ignore_for_file: avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitpulse/firebase/models/add_player_model.dart';
import 'package:path_provider/path_provider.dart';

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

  static Future<String> saveImageLocally(File imageFile) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final String newPath =
          '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
      final File newImage = await imageFile.copy(newPath);
      return newImage.path;
    } catch (e) {
      print("❌ Error saving image locally: $e");
      return "";
    }
  }

  static Future<void> addPlayerData(
      AddPlayerDataModel addPlayerDataModel, File file) async {
    try {
      var collection = getPlayersCollection();
      var docRef = collection.doc();
      addPlayerDataModel.id = docRef.id;

      addPlayerDataModel.imageUrl = await saveImageLocally(file);

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

  static Future<void> deletePlayer(String playerId, String? imagePath) async {
    try {
      await getPlayersCollection().doc(playerId).delete();
      print("✅ Player deleted from Firestore: $playerId");

      if (imagePath != null && imagePath.isNotEmpty) {
        File imageFile = File(imagePath);
        if (imageFile.existsSync()) {
          await imageFile.delete();
          print("✅ Player image deleted locally: $imagePath");
        } else {
          print("⚠️ Image file not found: $imagePath");
        }
      }
    } catch (e) {
      print("❌ Error deleting player: $e");
    }
  }
}
