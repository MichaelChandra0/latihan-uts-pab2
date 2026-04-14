import 'package:firebase_database/firebase_database.dart';

class LatihanServices {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Future<List<Map<String, dynamic>>> getData() async {
    final snapshot = await _database.get();

    List<Map<String, dynamic>> userList = [];

    if (snapshot.exists && snapshot.value != null) {
      final data = snapshot.value;

      if (data is List) {
        for (var item in data) {
          userList.add({'name': item['name'], 'bio': item['bio']});
        }
      }
    }
    return userList;
  }

  // void addShoppingList(String itemName) {
  //   _database.push().set({'name': itemName});
  // }

  // Future<void> removeShoppingList(String key) async {
  //   await _database.child(key).remove();
  // }
}
