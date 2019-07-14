class MenuEntity {
	List<ManuItems> items;

	MenuEntity({this.items});

	MenuEntity.fromJson(Map<String, dynamic> json) {
		if (json['items'] != null) {
			items = new List<ManuItems>();(json['items'] as List).forEach((v) { items.add(new ManuItems.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.items != null) {
      data['items'] =  this.items.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ManuItems {
	String jumpUrl;
	String picUrl;
	String title;

	ManuItems({this.jumpUrl, this.picUrl, this.title});

	ManuItems.fromJson(Map<String, dynamic> json) {
		jumpUrl = json['jump_url'];
		picUrl = json['pic_url'];
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['jump_url'] = this.jumpUrl;
		data['pic_url'] = this.picUrl;
		data['title'] = this.title;
		return data;
	}
}
