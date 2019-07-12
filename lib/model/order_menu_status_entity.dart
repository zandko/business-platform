class OrderMenuStatusEntity {
  List<OrderMenuStatusItem> menustatus;

  OrderMenuStatusEntity({this.menustatus});

  OrderMenuStatusEntity.fromJson(Map<String, dynamic> json) {
    if (json['menustatus'] != null) {
      menustatus = new List<OrderMenuStatusItem>();
      (json['menustatus'] as List).forEach((v) {
        menustatus.add(new OrderMenuStatusItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menustatus != null) {
      data['menustatus'] = this.menustatus.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderMenuStatusItem {
  String picUrl;
  String title;

  OrderMenuStatusItem({this.picUrl, this.title});

  OrderMenuStatusItem.fromJson(Map<String, dynamic> json) {
    picUrl = json['pic_url'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic_url'] = this.picUrl;
    data['title'] = this.title;
    return data;
  }
}
