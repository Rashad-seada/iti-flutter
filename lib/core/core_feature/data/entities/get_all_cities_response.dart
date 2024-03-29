import 'citie_entity.dart';

class GetAllCitiesResponse {
  bool? isSuccssed;
  String? message;
  List<CityEntity>? obj;
  dynamic? errors;

  GetAllCitiesResponse(
      {this.isSuccssed, this.message, this.obj, this.errors});

  GetAllCitiesResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <CityEntity>[];
      json['obj'].forEach((v) {
        obj!.add(new CityEntity.fromJson(v));
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

