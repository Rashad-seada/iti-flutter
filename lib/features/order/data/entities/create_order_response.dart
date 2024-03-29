class CreateOrderResponse {
  bool? isSuccssed;
  String? message;
  Null? obj;
  Null? errors;

  CreateOrderResponse({this.isSuccssed, this.message, this.obj, this.errors});

  CreateOrderResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    obj = json['obj'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccssed'] = this.isSuccssed;
    data['message'] = this.message;
    data['obj'] = this.obj;
    data['errors'] = this.errors;
    return data;
  }
}