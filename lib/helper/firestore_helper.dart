import'package:firebase_auth/firebase_auth.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';



class Firestorehelper{
  //Variable

  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseStorage.instance;
  final cloudFirestore = FirebaseFirestore.instance;
  final firestoreProfil = FirebaseFirestore.instance.collection("profil");



  // Méthode
register(String mail, String password,String nom,String prenom) async{
  var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail, password: password);
  User user = result.user!;
  String uid = user.uid;
  Map <String,dynamic> map ={
    "nom": nom,
    "prenom":prenom
  };
  addUser(map,uid);
}

Future <User> connect(String mail, password) async{
  var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: mail, password: password);
  User user = result.user!;
  return user;

}


addUser(Map<String,dynamic> map, String identifiant){
  firestoreProfil.doc(identifiant).set(map);

}








}