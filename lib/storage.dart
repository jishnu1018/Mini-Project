import "dart:typed_data";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";
//import "package:firebase_storage/firebase_storage.dart";
//import "package:mini_project/views/splash_screen.dart";

final FirebaseStorage storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Storedata {
  Future<String> uploadImage(
      String image, String profile, Uint8List file) async {
    Reference ref = storage
        .ref()
        .child(image)
        .child(profile)
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> addImage({required Uint8List file}) async {
    try {
//       secureStorage.readSecureData('role').then((value){
// Finalrole=value;
//       });
      String res = "something went wrong";

      String imageUrl =
          await uploadImage('Image Folder', "profile Image", file);
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(
        {'imageLink': imageUrl},
      );

      res = "success";
      return res;
    } catch (e) {
      return e.toString();
    }
  }
}
