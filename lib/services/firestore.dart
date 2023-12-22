import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collection of furqan
  final CollectionReference furqan =
      FirebaseFirestore.instance.collection('furqan');

  //CREAD
  Future<void> addfurqan(String furqanData) {
    return furqan.add({
      'furqan': furqanData,
      'timestamp': Timestamp.now(),
    });
  }

  //READ
  Stream<QuerySnapshot> getfurqanStream() {
    final furqanStream =
        furqan.orderBy('timestamp', descending: true).snapshots();
    return furqanStream;
  }

  //UPDATE

  //DELETE
}
