import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
final FirebaseFirestore firestore = FirebaseFirestore.instance;

CollectionReference reviewsCollection = firestore.collection('review');

void addReview(String movieTitle, String name, String comment, String evaluation){
  reviewsCollection.add({
    'movie_title' : movieTitle,
  'name' : name,
  'comment' : comment,
  'evaluation' : evaluation,
  'registration_date' : DateTime.now(),
  }).then((value)=> print('review added'));
}

Stream<QuerySnapshot> getReviews(String movieTitle){
  return reviewsCollection.where("movie_title", isEqualTo: movieTitle).snapshots();
}

