import 'ad_entity.dart';

class GetHomeResponse {
  bool? isSuccssed;
  String? message;
  List<AdEntity>? obj;
  dynamic errors;

  GetHomeResponse({this.isSuccssed, this.message, this.obj, this.errors});

  GetHomeResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <AdEntity>[];
      json['obj'].forEach((v) {
        obj!.add(AdEntity.fromJson(v));
      });
    }
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccssed'] = isSuccssed;
    data['message'] = message;
    if (obj != null) {
      data['obj'] = obj!.map((v) => v.toJson()).toList();
    }
    data['errors'] = errors;
    return data;
  }
}

