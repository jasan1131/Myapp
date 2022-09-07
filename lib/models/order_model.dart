// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderModel {
  String? id;
  String? idSeller;
  String? nameSeller;
  String? idRider;
  String? nameRider;
  String? idBuyer;
  String? nameBuyer;
  String? distance;
  String? transport;
  String? dateOrder;
  String? timeOrder;
  String? nameProduct;
  String? priceProduct;
  String? amount;
  String? sum;
  String? total;
  String? status;
  OrderModel({
    this.id,
    this.idSeller,
    this.nameSeller,
    this.idRider,
    this.nameRider,
    this.idBuyer,
    this.nameBuyer,
    this.distance,
    this.transport,
    this.dateOrder,
    this.timeOrder,
    this.nameProduct,
    this.priceProduct,
    this.amount,
    this.sum,
    this.total,
    this.status,
  });

  OrderModel copyWith({
    String? id,
    String? idSeller,
    String? nameSeller,
    String? idRider,
    String? nameRider,
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
    String? status,
  }) {
    return OrderModel(
      id: id ?? this.id,
      idSeller: idSeller ?? this.idSeller,
      nameSeller: nameSeller ?? this.nameSeller,
      idRider: idRider ?? this.idRider,
      nameRider: nameRider ?? this.nameRider,
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
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idSeller': idSeller,
      'nameSeller': nameSeller,
      'idRider': idRider,
      'nameRider': nameRider,
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
      'status': status,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] != null ? map['id'] as String : null,
      idSeller: map['idSeller'] != null ? map['idSeller'] as String : null,
      nameSeller: map['nameSeller'] != null ? map['nameSeller'] as String : null,
      idRider: map['idRider'] != null ? map['idRider'] as String : null,
      nameRider: map['nameRider'] != null ? map['nameRider'] as String : null,
      idBuyer: map['idBuyer'] != null ? map['idBuyer'] as String : null,
      nameBuyer: map['nameBuyer'] != null ? map['nameBuyer'] as String : null,
      distance: map['distance'] != null ? map['distance'] as String : null,
      transport: map['transport'] != null ? map['transport'] as String : null,
      dateOrder: map['dateOrder'] != null ? map['dateOrder'] as String : null,
      timeOrder: map['timeOrder'] != null ? map['timeOrder'] as String : null,
      nameProduct: map['nameProduct'] != null ? map['nameProduct'] as String : null,
      priceProduct: map['priceProduct'] != null ? map['priceProduct'] as String : null,
      amount: map['amount'] != null ? map['amount'] as String : null,
      sum: map['sum'] != null ? map['sum'] as String : null,
      total: map['total'] != null ? map['total'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, idSeller: $idSeller, nameSeller: $nameSeller, idRider: $idRider, nameRider: $nameRider, idBuyer: $idBuyer, nameBuyer: $nameBuyer, distance: $distance, transport: $transport, dateOrder: $dateOrder, timeOrder: $timeOrder, nameProduct: $nameProduct, priceProduct: $priceProduct, amount: $amount, sum: $sum, total: $total, status: $status)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idSeller == idSeller &&
      other.nameSeller == nameSeller &&
      other.idRider == idRider &&
      other.nameRider == nameRider &&
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
      other.total == total &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idSeller.hashCode ^
      nameSeller.hashCode ^
      idRider.hashCode ^
      nameRider.hashCode ^
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
      total.hashCode ^
      status.hashCode;
  }
}
