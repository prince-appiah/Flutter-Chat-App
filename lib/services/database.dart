import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _users = FirebaseFirestore.instance.collection('users');
  CollectionReference _chatroom =
      FirebaseFirestore.instance.collection('chatroom');

  Future createUser(userData) async {
    try {
      return await _users
          .add(userData)
          .then((value) => print('User added: $value'))
          .catchError((error) => print('Failed to add user: $error'));
    } catch (e) {
      print(e);
    }
  }

  Future fetchUser(String username) async {
    try {
      return await _users.where("username", isEqualTo: username).get();
    } catch (e) {
      print(e);
    }
  }

  Future createRoom(String roomId, roomData) async {
    try {
      return await _chatroom.doc(roomId).set(roomData).catchError((e) {
        print(e);
      });
    } catch (e) {
      print(e);
    }
  }
}
