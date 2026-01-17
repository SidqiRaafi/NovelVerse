import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/novel.dart';

class FirestoreService {
  final CollectionReference _novelsCollection =
      FirebaseFirestore.instance.collection('novels');

  // Get all novels
  Stream<List<Novel>> getNovels() {
    return _novelsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Novel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Search novels by title
  Stream<List<Novel>> searchNovels(String query) {
    if (query.isEmpty) {
      return getNovels();
    }

    return _novelsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Novel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).where((novel) {
        return novel.title.toLowerCase().contains(query.toLowerCase()) ||
            novel.author.toLowerCase().contains(query.toLowerCase()) ||
            novel.genre.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  // Add novel
  Future<void> addNovel(Novel novel) async {
    await _novelsCollection.add(novel.toMap());
  }

  // Update novel
  Future<void> updateNovel(Novel novel) async {
    await _novelsCollection.doc(novel.id).update(novel.toMap());
  }

  // Delete novel
  Future<void> deleteNovel(String novelId) async {
    await _novelsCollection.doc(novelId).delete();
  }
}
