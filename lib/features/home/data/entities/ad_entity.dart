class AdEntity {
  int? sellerId;
  String? description;
  String? imgUrl;

  AdEntity({this.sellerId, this.description, this.imgUrl});

  AdEntity.fromJson(Map<String, dynamic> json) {
    sellerId = json['sellerId'];
    description = json['description'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sellerId'] = this.sellerId;
    data['description'] = this.description;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}