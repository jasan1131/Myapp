// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HistoryModel {
  final String id;
  final String idSeller;
  final String nameSeller;
  final String idBuyer;
  final String nameBuyer;
  final String distance;
  final String transport;
  final String dateOrder;
  final String timeOrder;
  final String nameProduct;
  final String priceProduct;
  final String amount;
  final String sum;
  final String total;
  HistoryModel({
    required this.id,
    required this.idSeller,
    required this.nameSeller,
    required this.idBuyer,
    required this.nameBuyer,
    required this.distance,
    required this.transport,
    required this.dateOrder,
    required this.timeOrder,
    required this.nameProduct,
    required this.priceProduct,
    required this.amount,
    required this.sum,
    required this.total,
  });


  HistoryModel copyWith({
    String? id,
    String? idSeller,
    String? nameSeller,
    String? idBuyer,
    String? nameBuyer,
    String? distance,
    String? transport,
    String? dateOrder,
    String? timeOrder,
    String? nameProduct,
    String? priceProduct,
    String? amount,
    String? sum,
    String? total,
  }) {
    return HistoryModel(
      id: id ?? this.id,
      idSeller: idSeller ?? this.idSeller,
      nameSeller: nameSeller ?? this.nameSeller,
      idBuyer: idBuyer ?? this.idBuyer,
      nameBuyer: nameBuyer ?? this.nameBuyer,
      distance: distance ?? this.distance,
      transport: transport ?? this.transport,
      dateOrder: dateOrder ?? this.dateOrder,
      timeOrder: timeOrder ?? this.timeOrder,
      nameProduct: nameProduct ?? this.nameProduct,
      priceProduct: priceProduct ?? this.priceProduct,
      amount: amount ?? this.amount,
      sum: sum ?? this.sum,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idSeller': idSeller,
      'nameSeller': nameSeller,
      'idBuyer': idBuyer,
      'nameBuyer': nameBuyer,
      'distance': distance,
      'transport': transport,
      'dateOrder': dateOrder,
      'timeOrder': timeOrder,
      'nameProduct': nameProduct,
      'priceProduct': priceProduct,
      'amount': amount,
      'sum': sum,
      'total': total,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      id: map['id'] as String,
      idSeller: map['idSeller'] as String,
      nameSeller: map['nameSeller'] as String,
      idBuyer: map['idBuyer'] as String,
      nameBuyer: map['nameBuyer'] as String,
      distance: map['distance'] as String,
      transport: map['transport'] as String,
      dateOrder: map['dateOrder'] as String,
      timeOrder: map['timeOrder'] as String,
      nameProduct: map['nameProduct'] as String,
      priceProduct: map['priceProduct'] as String,
      amount: map['amount'] as String,
      sum: map['sum'] as String,
      total: map['total'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) => HistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoryModel(id: $id, idSeller: $idSeller, nameSeller: $nameSeller, idBuyer: $idBuyer, nameBuyer: $nameBuyer, distance: $distance, transport: $transport, dateOrder: $dateOrder, timeOrder: $timeOrder, nameProduct: $nameProduct, priceProduct: $priceProduct, amount: $amount, sum: $sum, total: $total)';
  }

  @override
  bool operator ==(covariant HistoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idSeller == idSeller &&
      other.nameSeller == nameSeller &&
      other.idBuyer == idBuyer &&
      other.nameBuyer == nameBuyer &&
      other.distance == distance &&
      other.transport == transport &&
      other.dateOrder == dateOrder &&
      other.timeOrder == timeOrder &&
      other.nameProduct == nameProduct &&
      other.priceProduct == priceProduct &&
      other.amount == amount &&
      other.sum == sum &&
      other.total == total;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idSeller.hashCode ^
      nameSeller.hashCode ^
      idBuyer.hashCode ^
      nameBuyer.hashCode ^
      distance.hashCode ^
      transport.hashCode ^
      dateOrder.hashCode ^
      timeOrder.hashCode ^
      nameProduct.hashCode ^
      priceProduct.hashCode ^
      amount.hashCode ^
      sum.hashCode ^
      total.hashCode;
  }
}
