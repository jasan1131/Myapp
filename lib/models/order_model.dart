class OrderModel {
  String? id;
  String? idSeller;
  String? nameSeller;
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

  OrderModel(
      {this.id,
      this.idSeller,
      this.nameSeller,
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
      this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idSeller = json['idSeller'];
    nameSeller = json['nameSeller'];
    idBuyer = json['idBuyer'];
    nameBuyer = json['nameBuyer'];
    distance = json['distance'];
    transport = json['transport'];
    dateOrder = json['dateOrder'];
    timeOrder = json['timeOrder'];
    nameProduct = json['nameProduct'];
    priceProduct = json['priceProduct'];
    amount = json['amount'];
    sum = json['sum'];
    total = json['total'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idSeller'] = this.idSeller;
    data['nameSeller'] = this.nameSeller;
    data['idBuyer'] = this.idBuyer;
    data['nameBuyer'] = this.nameBuyer;
    data['distance'] = this.distance;
    data['transport'] = this.transport;
    data['dateOrder'] = this.dateOrder;
    data['timeOrder'] = this.timeOrder;
    data['nameProduct'] = this.nameProduct;
    data['priceProduct'] = this.priceProduct;
    data['amount'] = this.amount;
    data['sum'] = this.sum;
    data['total'] = this.total;
    data['status'] = this.status;
    return data;
  }
}
