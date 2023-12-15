import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadProfilePhoto(File photo, User user) async {
    Reference storageReference = _firebaseStorage.ref().child('profile_photos/${user.uid}');
    // Upload the file
    UploadTask uploadTask = storageReference.putFile(photo);

    // Wait for the upload to complete and return the download URL
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null).onError((error, stackTrace) => throw (Exception(error)));
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    return downloadURL;
  }
}
