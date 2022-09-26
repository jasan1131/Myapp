// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String id;
  final String avatar;
  final String type;
  final String nameseller;
  final String name;
  final String seconname;
  final String user;
  final String password;
  final String address;
  final String phone;
  final String facebook;
  final String line;
  final String instargarm;
  final String twitter;
  final String lat;
  final String lng;
  final String token;
  UserModel({
    required this.id,
    required this.avatar,
    required this.type,
    required this.nameseller,
    required this.name,
    required this.seconname,
    required this.user,
    required this.password,
    required this.address,
    required this.phone,
    required this.facebook,
    required this.line,
    required this.instargarm,
    required this.twitter,
    required this.lat,
    required this.lng,
    required this.token,
  });

  UserModel copyWith({
    String? id,
    String? avatar,
    String? type,
    String? nameseller,
    String? name,
    String? seconname,
    String? user,
    String? password,
    String? address,
    String? phone,
    String? facebook,
    String? line,
    String? instargarm,
    String? twitter,
    String? lat,
    String? lng,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      type: type ?? this.type,
      nameseller: nameseller ?? this.nameseller,
      name: name ?? this.name,
      seconname: seconname ?? this.seconname,
      user: user ?? this.user,
      password: password ?? this.password,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      facebook: facebook ?? this.facebook,
      line: line ?? this.line,
      instargarm: instargarm ?? this.instargarm,
      twitter: twitter ?? this.twitter,
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
      'nameseller': nameseller,
      'name': name,
      'seconname': seconname,
      'user': user,
      'password': password,
      'address': address,
      'phone': phone,
      'facebook': facebook,
      'line': line,
      'instargarm': instargarm,
      'twitter': twitter,
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
      nameseller: map['nameseller'] as String,
      name: map['name'] as String,
      seconname: map['seconname'] as String,
      user: map['user'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
      facebook: map['facebook'] as String,
      line: map['line'] as String,
      instargarm: map['instargarm'] as String,
      twitter: map['twitter'] as String,
      lat: map['lat'] as String,
      lng: map['lng'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, avatar: $avatar, type: $type, nameseller: $nameseller, name: $name, seconname: $seconname, user: $user, password: $password, address: $address, phone: $phone, facebook: $facebook, line: $line, instargarm: $instargarm, twitter: $twitter, lat: $lat, lng: $lng, token: $token)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.avatar == avatar &&
      other.type == type &&
      other.nameseller == nameseller &&
      other.name == name &&
      other.seconname == seconname &&
      other.user == user &&
      other.password == password &&
      other.address == address &&
      other.phone == phone &&
      other.facebook == facebook &&
      other.line == line &&
      other.instargarm == instargarm &&
      other.twitter == twitter &&
      other.lat == lat &&
      other.lng == lng &&
      other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      avatar.hashCode ^
      type.hashCode ^
      nameseller.hashCode ^
      name.hashCode ^
      seconname.hashCode ^
      user.hashCode ^
      password.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      facebook.hashCode ^
      line.hashCode ^
      instargarm.hashCode ^
      twitter.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      token.hashCode;
  }
}
