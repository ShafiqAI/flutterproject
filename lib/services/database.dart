import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference profilecollection =
      Firestore.instance.collection('profile');

  Future updateUserData(String email, String password) async {
    return await profilecollection
        .document(uid)
        .setData({'email': email, 'password': password});
  }

  Future updateUserEmail(String email) async {
    return await profilecollection.document(uid).setData({'email': email});
  }

  TheUser _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return TheUser(uid: uid, email: snapshot.data['email']);
  }

  //get profile stream
  Stream<TheUser> get profiles {
    return profilecollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  Stream<TheUser> get email {
    return profilecollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
