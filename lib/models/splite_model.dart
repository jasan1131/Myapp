// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SQLiteModel {
  final int? id;
  final String idSeller;
  final String nameSeller;
  final String idProduct;
  final String nameProduct;
  final String priceProduct;
  final String amount;
  final String sum;
  final String distance;
  final String transport;
  SQLiteModel({
    this.id,
    required this.idSeller,
    required this.nameSeller,
    required this.idProduct,
    required this.nameProduct,
    required this.priceProduct,
    required this.amount,
    required this.sum,
    required this.distance,
    required this.transport,
  });

  SQLiteModel copyWith({
    int? id,
    String? idSeller,
    String? nameSeller,
    String? idProduct,
    String? nameProduct,
    String? priceProduct,
    String? amount,
    String? sum,
    String? distance,
    String? transport,
  }) {
    return SQLiteModel(
      id: id ?? this.id,
      idSeller: idSeller ?? this.idSeller,
      nameSeller: nameSeller ?? this.nameSeller,
      idProduct: idProduct ?? this.idProduct,
      nameProduct: nameProduct ?? this.nameProduct,
      priceProduct: priceProduct ?? this.priceProduct,
      amount: amount ?? this.amount,
      sum: sum ?? this.sum,
      distance: distance ?? this.distance,
      transport: transport ?? this.transport,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idSeller': idSeller,
      'nameSeller': nameSeller,
      'idProduct': idProduct,
      'nameProduct': nameProduct,
      'priceProduct': priceProduct,
      'amount': amount,
      'sum': sum,
      'distance': distance,
      'transport': transport,
    };
  }

  factory SQLiteModel.fromMap(Map<String, dynamic> map) {
    return SQLiteModel(
      id: map['id'] != null ? map['id'] as int : null,
      idSeller: map['idSeller'] as String,
      nameSeller: map['nameSeller'] as String,
      idProduct: map['idProduct'] as String,
      nameProduct: map['nameProduct'] as String,
      priceProduct: map['priceProduct'] as String,
      amount: map['amount'] as String,
      sum: map['sum'] as String,
      distance: map['distance'] as String,
      transport: map['transport'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SQLiteModel.fromJson(String source) => SQLiteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SQLiteModel(id: $id, idSeller: $idSeller, nameSeller: $nameSeller, idProduct: $idProduct, nameProduct: $nameProduct, priceProduct: $priceProduct, amount: $amount, sum: $sum, distance: $distance, transport: $transport)';
  }

  @override
  bool operator ==(covariant SQLiteModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idSeller == idSeller &&
      other.nameSeller == nameSeller &&
      other.idProduct == idProduct &&
      other.nameProduct == nameProduct &&
      other.priceProduct == priceProduct &&
      other.amount == amount &&
      other.sum == sum &&
      other.distance == distance &&
      other.transport == transport;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idSeller.hashCode ^
      nameSeller.hashCode ^
      idProduct.hashCode ^
      nameProduct.hashCode ^
      priceProduct.hashCode ^
      amount.hashCode ^
      sum.hashCode ^
      distance.hashCode ^
      transport.hashCode;
  }
}
