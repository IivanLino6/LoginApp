// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserData userFromJson(String str) => UserData.fromJson(json.decode(str));

String userToJson(UserData data) => json.encode(data.toJson());

class UserData {
    String id;
    String username;
    String email;
    String password;

    UserData({
        this.id ='',
        this.username='',
        this.email='',
        this.password='',
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
         id: json["id"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        password: json["Password"] ?? '',
    );
   
   //Si no quieres agregar un dato al firebase commenta el dato 
    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
    };
}
