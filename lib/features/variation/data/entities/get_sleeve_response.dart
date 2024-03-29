import 'hand_entity.dart';

class GetSleeveResponse {
  bool? isSuccssed;
  String? message;
  List<HandEntity>? obj;
  dynamic? errors;

  GetSleeveResponse({this.isSuccssed, this.message, this.obj, this.errors});

  GetSleeveResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <HandEntity>[];
      json['obj'].forEach((v) {
        obj!.add(new HandEntity.fromJson(v));
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

