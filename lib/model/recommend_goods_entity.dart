class RecommendGoodsEntity {
	List<RecommandGoodsItem> recommendGoods;

	RecommendGoodsEntity({this.recommendGoods});

	RecommendGoodsEntity.fromJson(Map<String, dynamic> json) {
		if (json['recommendGoods'] != null) {
			recommendGoods = new List<RecommandGoodsItem>();(json['recommendGoods'] as List).forEach((v) { recommendGoods.add(new RecommandGoodsItem.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.recommendGoods != null) {
      data['recommendGoods'] =  this.recommendGoods.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class RecommandGoodsItem {
	String highlight;
	int price;
	String picUrl;
	String title;
	String praise;

	RecommandGoodsItem({this.highlight, this.price, this.picUrl, this.title, this.praise});

	RecommandGoodsItem.fromJson(Map<String, dynamic> json) {
		highlight = json['highlight'];
		price = json['price'];
		picUrl = json['pic_url'];
		title = json['title'];
		praise = json['praise'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['highlight'] = this.highlight;
		data['price'] = this.price;
		data['pic_url'] = this.picUrl;
		data['title'] = this.title;
		data['praise'] = this.praise;
		return data;
	}
}
