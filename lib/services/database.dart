import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shopping_list/model/Item.dart';

class DatabaseService {

  final CollectionReference itemCollection = FirebaseFirestore.instance.collection('ShoppingItems');
  final Query allItems = FirebaseFirestore.instance.collectionGroup('ShoppingItems');

  // items from snapshot
  List<Item> _itemListFromSnapshot(QuerySnapshot snapshot){

    List<QueryDocumentSnapshot> docs = snapshot.docs;

    return docs.map((doc) {

      return Item(
        doc.id,
        doc.get('Name') ?? 'No name found!',
        doc.get('isCollected') ?? false,
      );
    }).toList();
  }

  // get items stream from Firebase Firestore.
  Stream<List<Item>> get items {
    return allItems.snapshots()
        .map(_itemListFromSnapshot);
  }

  Future addItem(String name, bool isCollected) async {

    Map<String, Object> map = {
      'Name' : name,
      'isCollected': isCollected,
    };

    return await itemCollection.add(map);
  }

  Future updateCollected(Item item) async{
    await itemCollection.doc(item.uid).set({
      'Name': item.name,
      'isCollected': item.isCollected,
    });
  }

  void removeItem(String uid) async {
    await itemCollection.doc(uid).delete();
  }
}