import 'package:cloud_firestore/cloud_firestore.dart';
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

  static void addPlayerData(AddPlayerDataModel addPlayerDataModel) {
    var collection = getPlayersCollection();
    var docRef = collection.doc();
    addPlayerDataModel.id = docRef.id;
    docRef.set(addPlayerDataModel);
  }

  static Future<QuerySnapshot<AddPlayerDataModel>> getPlayersData() {
    return getPlayersCollection().get();
  }
}
