// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class userModel {
  String name;
  String profilePic;
  String email;
  String uid;

  userModel(
      {required this.profilePic,
      required this.uid,
      required this.email,
      required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'email': email,
      'uid': uid,
    };
  }

  factory userModel.fromMap(Map<String, dynamic> map) {
    return userModel(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      email: map['email'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory userModel.fromJson(String source) =>
      userModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
