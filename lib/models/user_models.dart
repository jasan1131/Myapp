// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String id;
  final String avatar;
  final String type;
  final String name;
  final String seconname;
  final String user;
  final String password;
  final String address;
  final String phone;
  final String lat;
  final String lng;
  final String token;
  UserModel({
    required this.id,
    required this.avatar,
    required this.type,
    required this.name,
    required this.seconname,
    required this.user,
    required this.password,
    required this.address,
    required this.phone,
    required this.lat,
    required this.lng,
    required this.token,
  });

  UserModel copyWith({
    String? id,
    String? avatar,
    String? type,
    String? name,
    String? seconname,
    String? user,
    String? password,
    String? address,
    String? phone,
    String? lat,
    String? lng,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      type: type ?? this.type,
      name: name ?? this.name,
      seconname: seconname ?? this.seconname,
      user: user ?? this.user,
      password: password ?? this.password,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'avatar': avatar,
      'type': type,
      'name': name,
      'seconname': seconname,
      'user': user,
      'password': password,
      'address': address,
      'phone': phone,
      'lat': lat,
      'lng': lng,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      avatar: map['avatar'] as String,
      type: map['type'] as String,
      name: map['name'] as String,
      seconname: map['seconname'] as String,
      user: map['user'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
      lat: map['lat'] as String,
      lng: map['lng'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, avatar: $avatar, type: $type, name: $name, seconname: $seconname, user: $user, password: $password, address: $address, phone: $phone, lat: $lat, lng: $lng, token: $token)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.avatar == avatar &&
      other.type == type &&
      other.name == name &&
      other.seconname == seconname &&
      other.user == user &&
      other.password == password &&
      other.address == address &&
      other.phone == phone &&
      other.lat == lat &&
      other.lng == lng &&
      other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      avatar.hashCode ^
      type.hashCode ^
      name.hashCode ^
      seconname.hashCode ^
      user.hashCode ^
      password.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      token.hashCode;
  }
  }
