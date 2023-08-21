import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreProfileImgData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String dounloadUrl = await snapshot.ref.getDownloadURL();
    return dounloadUrl;
  }

  Future<String> saveData({required Uint8List file}) async {
    String resp = 'Some error occured';
    try {
      String imageUrl = await uploadImageToStorage('profileImage', file);
      await _firestore.collection('userProfile').add({'imageLink': imageUrl});
      resp = 'Success';
    } catch (e) {
      resp = e.toString();
    }
    return resp;
  }
}
