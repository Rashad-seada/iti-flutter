import 'chest_entity.dart';

class GetChestResponse {
  bool? isSuccssed;
  String? message;
  List<ChestEntity>? obj;
  Null? errors;

  GetChestResponse({this.isSuccssed, this.message, this.obj, this.errors});

  GetChestResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <ChestEntity>[];
      json['obj'].forEach((v) {
        obj!.add(new ChestEntity.fromJson(v));
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

