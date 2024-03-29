import 'coller_entity.dart';

class GetCollarResponse {
  bool? isSuccssed;
  String? message;
  List<CollarEntity>? obj;
  Null? errors;

  GetCollarResponse({this.isSuccssed, this.message, this.obj, this.errors});

  GetCollarResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <CollarEntity>[];
      json['obj'].forEach((v) {
        obj!.add(new CollarEntity.fromJson(v));
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

