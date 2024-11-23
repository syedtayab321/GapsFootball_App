import 'package:cloud_firestore/cloud_firestore.dart';

class LoginModel {
  String uid;
  String email;
  String role;

  LoginModel({required this.uid, required this.email, required this.role});

  factory LoginModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return LoginModel(
      uid: doc.id,
      email: data['email'] ?? '',
      role: data['role'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'role': role,
    };
  }
}
