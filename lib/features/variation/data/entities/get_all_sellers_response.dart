import 'package:smart_soft/features/variation/data/entities/seller_entity.dart';

class GetAllSellersResponse {
  bool? isSuccssed;
  String? message;
  List<SellerEntity>? obj;
  Null? errors;

  GetAllSellersResponse({this.isSuccssed, this.message, this.obj, this.errors});

  GetAllSellersResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <SellerEntity>[];
      json['obj'].forEach((v) {
        obj!.add(SellerEntity.fromJson(v));
      });
    }
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccssed'] = this.isSuccssed;
    data['message'] = this.message;
    if (this.obj != null) {
      data['obj'] = this.obj!.map((v) => v.toJson()).toList();
    }
    data['errors'] = this.errors;
    return data;
  }
}

