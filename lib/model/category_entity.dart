class CategoryEntity {
	List<CategoryItem> items;

	CategoryEntity({this.items});

	CategoryEntity.fromJson(Map<String, dynamic> json) {
		if (json['items'] != null) {
			items = new List<CategoryItem>();(json['items'] as List).forEach((v) { items.add(new CategoryItem.fromJson(v)); });
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

class CategoryItem {
	String title;

	CategoryItem({this.title});

	CategoryItem.fromJson(Map<String, dynamic> json) {
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		return data;
	}
}
