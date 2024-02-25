class LoginResponse {
  bool? isSuccssed;
  String? message;
  Obj? obj;
  Null? errors;

  LoginResponse({this.isSuccssed, this.message, this.obj, this.errors});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    obj = json['obj'] != null ? new Obj.fromJson(json['obj']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccssed'] = this.isSuccssed;
    data['message'] = this.message;
    if (this.obj != null) {
      data['obj'] = this.obj!.toJson();
    }
    data['errors'] = this.errors;
    return data;
  }
}

class Obj {
  String? token;
  String? expiration;

  Obj({this.token, this.expiration});

  Obj.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expiration'] = this.expiration;
    return data;
  }
}