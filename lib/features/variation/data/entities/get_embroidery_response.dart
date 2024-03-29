import 'embroidery_entity.dart';

class GetEmbroideryResponse {
  bool? isSuccssed;
  String? message;
  List<EmbroideryEntity>? obj;
  dynamic? errors;

  GetEmbroideryResponse({this.isSuccssed, this.message, this.obj, this.errors});

  GetEmbroideryResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <EmbroideryEntity>[];
      json['obj'].forEach((v) {
        obj!.add(new EmbroideryEntity.fromJson(v));
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

