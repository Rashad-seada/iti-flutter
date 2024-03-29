import 'fabric_entity.dart';

class GetFabricResponse {
  bool? isSuccssed;
  String? message;
  List<FabricEntity>? obj;
  dynamic? errors;

  GetFabricResponse({this.isSuccssed, this.message, this.obj, this.errors});

  GetFabricResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <FabricEntity>[];
      json['obj'].forEach((v) {
        obj!.add(new FabricEntity.fromJson(v));
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

