import 'front_pocket_entity.dart';

class GetFrontPocketResponse {
  bool? isSuccssed;
  String? message;
  List<FrontPocketEntity>? obj;
  dynamic errors;

  GetFrontPocketResponse(
      {this.isSuccssed, this.message, this.obj, this.errors});

  GetFrontPocketResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <FrontPocketEntity>[];
      json['obj'].forEach((v) {
        obj!.add(new FrontPocketEntity.fromJson(v));
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

