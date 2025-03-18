import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add to watchlist
  Future<void> addToWatchlist(String symbol, String name) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("User not authenticated");

    await _firestore.collection('users').doc(user.uid).collection('watchlist').doc(symbol).set({
      'symbol': symbol,
      'name': name,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Get watchlist stream
  Stream<QuerySnapshot> getWatchlist() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("User not authenticated");

    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}