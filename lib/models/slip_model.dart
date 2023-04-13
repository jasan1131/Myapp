// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SlipModel {
  final String id;
  final String idbuyer;
  final String namebuyer;
  final String secondnamebuyer;
  final String dateDay;
  final String dateTime;
  final String pathslip;
  final String status;
  SlipModel({
    required this.id,
    required this.idbuyer,
    required this.namebuyer,
    required this.secondnamebuyer,
    required this.dateDay,
    required this.dateTime,
    required this.pathslip,
    required this.status,
  });

  SlipModel copyWith({
    String? id,
    String? idbuyer,
    String? namebuyer,
    String? secondnamebuyer,
    String? dateDay,
    String? dateTime,
    String? pathslip,
    String? status,
  }) {
    return SlipModel(
      id: id ?? this.id,
      idbuyer: idbuyer ?? this.idbuyer,
      namebuyer: namebuyer ?? this.namebuyer,
      secondnamebuyer: secondnamebuyer ?? this.secondnamebuyer,
      dateDay: dateDay ?? this.dateDay,
      dateTime: dateTime ?? this.dateTime,
      pathslip: pathslip ?? this.pathslip,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idbuyer': idbuyer,
      'namebuyer': namebuyer,
      'secondnamebuyer': secondnamebuyer,
      'dateDay': dateDay,
      'dateTime': dateTime,
      'pathslip': pathslip,
      'status': status,
    };
  }

  factory SlipModel.fromMap(Map<String, dynamic> map) {
    return SlipModel(
      id: map['id'] as String,
      idbuyer: map['idbuyer'] as String,
      namebuyer: map['namebuyer'] as String,
      secondnamebuyer: map['secondnamebuyer'] as String,
      dateDay: map['dateDay'] as String,
      dateTime: map['dateTime'] as String,
      pathslip: map['pathslip'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SlipModel.fromJson(String source) => SlipModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SlipModel(id: $id, idbuyer: $idbuyer, namebuyer: $namebuyer, secondnamebuyer: $secondnamebuyer, dateDay: $dateDay, dateTime: $dateTime, pathslip: $pathslip, status: $status)';
  }

  @override
  bool operator ==(covariant SlipModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idbuyer == idbuyer &&
      other.namebuyer == namebuyer &&
      other.secondnamebuyer == secondnamebuyer &&
      other.dateDay == dateDay &&
      other.dateTime == dateTime &&
      other.pathslip == pathslip &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idbuyer.hashCode ^
      namebuyer.hashCode ^
      secondnamebuyer.hashCode ^
      dateDay.hashCode ^
      dateTime.hashCode ^
      pathslip.hashCode ^
      status.hashCode;
  }
}
