class CategoryDataEntity {
	List<CategoryDataChilder> childer;
	String picUrl;

	CategoryDataEntity({this.childer, this.picUrl});

	CategoryDataEntity.fromJson(Map<String, dynamic> json) {
		if (json['childer'] != null) {
			childer = new List<CategoryDataChilder>();(json['childer'] as List).forEach((v) { childer.add(new CategoryDataChilder.fromJson(v)); });
		}
		picUrl = json['pic_url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.childer != null) {
      data['childer'] =  this.childer.map((v) => v.toJson()).toList();
    }
		data['pic_url'] = this.picUrl;
		return data;
	}
}

class CategoryDataChilder {
	List<CategoryDataChilderChilder> childer;
	String title;

	CategoryDataChilder({this.childer, this.title});

	CategoryDataChilder.fromJson(Map<String, dynamic> json) {
		if (json['childer'] != null) {
			childer = new List<CategoryDataChilderChilder>();(json['childer'] as List).forEach((v) { childer.add(new CategoryDataChilderChilder.fromJson(v)); });
		}
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.childer != null) {
      data['childer'] =  this.childer.map((v) => v.toJson()).toList();
    }
		data['title'] = this.title;
		return data;
	}
}

class CategoryDataChilderChilder {
	String picUrl;
	String title;

	CategoryDataChilderChilder({this.picUrl, this.title});

	CategoryDataChilderChilder.fromJson(Map<String, dynamic> json) {
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
