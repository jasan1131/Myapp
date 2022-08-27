// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final String id;
  final String idproduct;
  final String category;
  final String nameproduct;
  final String typeproduct;
  final String numberproduct;
  final String unitproduct;
  final String priceproduct;
  final String unitprice;
  final String detailproduct;
  final String imagesproduct;
  ProductModel({
    required this.id,
    required this.idproduct,
    required this.category,
    required this.nameproduct,
    required this.typeproduct,
    required this.numberproduct,
    required this.unitproduct,
    required this.priceproduct,
    required this.unitprice,
    required this.detailproduct,
    required this.imagesproduct,
  });

  ProductModel copyWith({
    String? id,
    String? idproduct,
    String? category,
    String? nameproduct,
    String? typeproduct,
    String? numberproduct,
    String? unitproduct,
    String? priceproduct,
    String? unitprice,
    String? detailproduct,
    String? imagesproduct,
  }) {
    return ProductModel(
      id: id ?? this.id,
      idproduct: idproduct ?? this.idproduct,
      category: category ?? this.category,
      nameproduct: nameproduct ?? this.nameproduct,
      typeproduct: typeproduct ?? this.typeproduct,
      numberproduct: numberproduct ?? this.numberproduct,
      unitproduct: unitproduct ?? this.unitproduct,
      priceproduct: priceproduct ?? this.priceproduct,
      unitprice: unitprice ?? this.unitprice,
      detailproduct: detailproduct ?? this.detailproduct,
      imagesproduct: imagesproduct ?? this.imagesproduct,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idproduct': idproduct,
      'category': category,
      'nameproduct': nameproduct,
      'typeproduct': typeproduct,
      'numberproduct': numberproduct,
      'unitproduct': unitproduct,
      'priceproduct': priceproduct,
      'unitprice': unitprice,
      'detailproduct': detailproduct,
      'imagesproduct': imagesproduct,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      idproduct: map['idproduct'] as String,
      category: map['category'] as String,
      nameproduct: map['nameproduct'] as String,
      typeproduct: map['typeproduct'] as String,
      numberproduct: map['numberproduct'] as String,
      unitproduct: map['unitproduct'] as String,
      priceproduct: map['priceproduct'] as String,
      unitprice: map['unitprice'] as String,
      detailproduct: map['detailproduct'] as String,
      imagesproduct: map['imagesproduct'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, idproduct: $idproduct, category: $category, nameproduct: $nameproduct, typeproduct: $typeproduct, numberproduct: $numberproduct, unitproduct: $unitproduct, priceproduct: $priceproduct, unitprice: $unitprice, detailproduct: $detailproduct, imagesproduct: $imagesproduct)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idproduct == idproduct &&
      other.category == category &&
      other.nameproduct == nameproduct &&
      other.typeproduct == typeproduct &&
      other.numberproduct == numberproduct &&
      other.unitproduct == unitproduct &&
      other.priceproduct == priceproduct &&
      other.unitprice == unitprice &&
      other.detailproduct == detailproduct &&
      other.imagesproduct == imagesproduct;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idproduct.hashCode ^
      category.hashCode ^
      nameproduct.hashCode ^
      typeproduct.hashCode ^
      numberproduct.hashCode ^
      unitproduct.hashCode ^
      priceproduct.hashCode ^
      unitprice.hashCode ^
      detailproduct.hashCode ^
      imagesproduct.hashCode;
  }
}
