import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snov/models/buyurtma.dart';
import 'package:snov/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference buyurtmaCollection =
      FirebaseFirestore.instance.collection("User");
  final CollectionReference taomlar =
      FirebaseFirestore.instance.collection("Taomlar");
  Future malumotUpdate({
    String? ism,
    List? buyurtma,
    String? name,
    List? like,
    int? buyurtmaSoni,
    String? number,
    String? izoh,
    String? id,
    String? image,
  }) async {
    return await buyurtmaCollection.doc(uid).set(
      {
        'ism': ism,
        'buyurtma': buyurtma,
        'name': name,
        'like': [],
        'buyurtmaSoni': buyurtmaSoni,
        'number': number,
        'izoh': izoh,
        'id': id,
        'image': image,
      },
    );
  }

  Future profilUpdate({
    String? name,
    String? number,
    String? izoh,
  }) async {
    return await buyurtmaCollection.doc(uid).update(
      {
        'name': name,
        'number': number,
        'izoh': izoh,
      },
    );
  }

  List<Malumotlar> _snapshotdanKelganData(QuerySnapshot snap) {
    return snap.docs.map((doc) {
      return Malumotlar(
        ism: doc['ism'] ?? 'Unknown',
        buyurtma: doc['buyurtma'] ?? [],
        name: doc['name'] ?? "Unknown",
        like: doc['like'] ?? [],
        buyurtmaSoni: doc['buyurtmaSoni'] ?? 0,
        number: doc['number'] ?? "+998000000000",
        izoh: doc['izoh'] ?? "Bo'sh",
        id: doc['id'] ?? "null",
        image: doc['image'] ?? "",
      );
    }).toList();
  }

  Stream<List<Malumotlar>> get buyurtmalar {
    return buyurtmaCollection.snapshots().map(_snapshotdanKelganData);
  }

  FoydalanuvchiData _snapshotdanKelganUserDatasi(DocumentSnapshot snap) {
    return FoydalanuvchiData(
      uid: uid,
      ism: snap['ism'],
      buyurtma: snap['buyurtma'],
      name: snap['name'],
      like: snap['like'],
      buyurtmaSoni: snap['buyurtmaSoni'],
      number: snap['number'],
      izoh: snap['izoh'],
      id: snap['id'],
      image: snap['image'],
    );
  }

  Stream<FoydalanuvchiData> get foydalanuvchiData {
    return buyurtmaCollection
        .doc(uid)
        .snapshots()
        .map(_snapshotdanKelganUserDatasi);
  }
}
