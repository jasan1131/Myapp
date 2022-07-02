// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductWholeSaleModel {
  final String Id;
  final String idProduct;
  final String nameProduct;
  final String typeProduct;
  final String numberProduct;
  final String priceProduct;
  final String detailProduct;
  final String imageProduct;
  ProductWholeSaleModel({
    required this.Id,
    required this.idProduct,
    required this.nameProduct,
    required this.typeProduct,
    required this.numberProduct,
    required this.priceProduct,
    required this.detailProduct,
    required this.imageProduct,
  });

  ProductWholeSaleModel copyWith({
    String? Id,
    String? idProduct,
    String? nameProduct,
    String? typeProduct,
    String? numberProduct,
    String? priceProduct,
    String? detailProduct,
    String? imageProduct,
  }) {
    return ProductWholeSaleModel(
      Id: Id ?? this.Id,
      idProduct: idProduct ?? this.idProduct,
      nameProduct: nameProduct ?? this.nameProduct,
      typeProduct: typeProduct ?? this.typeProduct,
      numberProduct: numberProduct ?? this.numberProduct,
      priceProduct: priceProduct ?? this.priceProduct,
      detailProduct: detailProduct ?? this.detailProduct,
      imageProduct: imageProduct ?? this.imageProduct,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Id': Id,
      'idProduct': idProduct,
      'nameProduct': nameProduct,
      'typeProduct': typeProduct,
      'numberProduct': numberProduct,
      'priceProduct': priceProduct,
      'detailProduct': detailProduct,
      'imageProduct': imageProduct,
    };
  }

  factory ProductWholeSaleModel.fromMap(Map<String, dynamic> map) {
    return ProductWholeSaleModel(
      Id: map['Id'] as String,
      idProduct: map['idProduct'] as String,
      nameProduct: map['nameProduct'] as String,
      typeProduct: map['typeProduct'] as String,
      numberProduct: map['numberProduct'] as String,
      priceProduct: map['priceProduct'] as String,
      detailProduct: map['detailProduct'] as String,
      imageProduct: map['imageProduct'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductWholeSaleModel.fromJson(String source) => ProductWholeSaleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductWholeSaleModel(Id: $Id, idProduct: $idProduct, nameProduct: $nameProduct, typeProduct: $typeProduct, numberProduct: $numberProduct, priceProduct: $priceProduct, detailProduct: $detailProduct, imageProduct: $imageProduct)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductWholeSaleModel &&
      other.Id == Id &&
      other.idProduct == idProduct &&
      other.nameProduct == nameProduct &&
      other.typeProduct == typeProduct &&
      other.numberProduct == numberProduct &&
      other.priceProduct == priceProduct &&
      other.detailProduct == detailProduct &&
      other.imageProduct == imageProduct;
  }

  @override
  int get hashCode {
    return Id.hashCode ^
      idProduct.hashCode ^
      nameProduct.hashCode ^
      typeProduct.hashCode ^
      numberProduct.hashCode ^
      priceProduct.hashCode ^
      detailProduct.hashCode ^
      imageProduct.hashCode;
  }
}
