// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductSpecialModel {
  final String iD;
  final String idproDuct;
  final String nameproDuct;
  final String typeproDuct;
  final String numberproDuct;
  final String priceproDuct;
  final String detailproDuct;
  final String imageproDuct;
  ProductSpecialModel({
    required this.iD,
    required this.idproDuct,
    required this.nameproDuct,
    required this.typeproDuct,
    required this.numberproDuct,
    required this.priceproDuct,
    required this.detailproDuct,
    required this.imageproDuct,
  });

  ProductSpecialModel copyWith({
    String? iD,
    String? idproDuct,
    String? nameproDuct,
    String? typeproDuct,
    String? numberproDuct,
    String? priceproDuct,
    String? detailproDuct,
    String? imageproDuct,
  }) {
    return ProductSpecialModel(
      iD: iD ?? this.iD,
      idproDuct: idproDuct ?? this.idproDuct,
      nameproDuct: nameproDuct ?? this.nameproDuct,
      typeproDuct: typeproDuct ?? this.typeproDuct,
      numberproDuct: numberproDuct ?? this.numberproDuct,
      priceproDuct: priceproDuct ?? this.priceproDuct,
      detailproDuct: detailproDuct ?? this.detailproDuct,
      imageproDuct: imageproDuct ?? this.imageproDuct,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iD': iD,
      'idproDuct': idproDuct,
      'nameproDuct': nameproDuct,
      'typeproDuct': typeproDuct,
      'numberproDuct': numberproDuct,
      'priceproDuct': priceproDuct,
      'detailproDuct': detailproDuct,
      'imageproDuct': imageproDuct,
    };
  }

  factory ProductSpecialModel.fromMap(Map<String, dynamic> map) {
    return ProductSpecialModel(
      iD: map['iD'] as String,
      idproDuct: map['idproDuct'] as String,
      nameproDuct: map['nameproDuct'] as String,
      typeproDuct: map['typeproDuct'] as String,
      numberproDuct: map['numberproDuct'] as String,
      priceproDuct: map['priceproDuct'] as String,
      detailproDuct: map['detailproDuct'] as String,
      imageproDuct: map['imageproDuct'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductSpecialModel.fromJson(String source) => ProductSpecialModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductSpecialModel(iD: $iD, idproDuct: $idproDuct, nameproDuct: $nameproDuct, typeproDuct: $typeproDuct, numberproDuct: $numberproDuct, priceproDuct: $priceproDuct, detailproDuct: $detailproDuct, imageproDuct: $imageproDuct)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductSpecialModel &&
      other.iD == iD &&
      other.idproDuct == idproDuct &&
      other.nameproDuct == nameproDuct &&
      other.typeproDuct == typeproDuct &&
      other.numberproDuct == numberproDuct &&
      other.priceproDuct == priceproDuct &&
      other.detailproDuct == detailproDuct &&
      other.imageproDuct == imageproDuct;
  }

  @override
  int get hashCode {
    return iD.hashCode ^
      idproDuct.hashCode ^
      nameproDuct.hashCode ^
      typeproDuct.hashCode ^
      numberproDuct.hashCode ^
      priceproDuct.hashCode ^
      detailproDuct.hashCode ^
      imageproDuct.hashCode;
  }
}
