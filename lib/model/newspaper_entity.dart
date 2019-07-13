class NewspaperEntity {
	List<NewspaperItem> newspaper;

	NewspaperEntity({this.newspaper});

	NewspaperEntity.fromJson(Map<String, dynamic> json) {
		if (json['newspaper'] != null) {
			newspaper = new List<NewspaperItem>();(json['newspaper'] as List).forEach((v) { newspaper.add(new NewspaperItem.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.newspaper != null) {
      data['newspaper'] =  this.newspaper.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class NewspaperItem {
	String description;
	String createdAt;
	String picUrl;
	String title;
	String browse;

	NewspaperItem({this.description, this.createdAt, this.picUrl, this.title, this.browse});

	NewspaperItem.fromJson(Map<String, dynamic> json) {
		description = json['description'];
		createdAt = json['created_at'];
		picUrl = json['pic_url'];
		title = json['title'];
		browse = json['browse'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['description'] = this.description;
		data['created_at'] = this.createdAt;
		data['pic_url'] = this.picUrl;
		data['title'] = this.title;
		data['browse'] = this.browse;
		return data;
	}
}
