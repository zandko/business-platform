class OptinsSetEntity {
  OptinsSetSettings settings;
  List<OptinsSetItem> items;

  OptinsSetEntity({this.settings, this.items});

  OptinsSetEntity.fromJson(Map<String, dynamic> json) {
    settings = json['settings'] != null
        ? new OptinsSetSettings.fromJson(json['settings'])
        : null;
    if (json['items'] != null) {
      items = new List<OptinsSetItem>();
      (json['items'] as List).forEach((v) {
        items.add(new OptinsSetItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.settings != null) {
      data['settings'] = this.settings.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptinsSetSettings {
  String picUrl;
  String title;

  OptinsSetSettings({this.picUrl, this.title});

  OptinsSetSettings.fromJson(Map<String, dynamic> json) {
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

class OptinsSetItem {
  String picUrl;
  String title;

  OptinsSetItem({this.picUrl, this.title});

  OptinsSetItem.fromJson(Map<String, dynamic> json) {
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
