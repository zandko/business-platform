class CartGoodsEntity {
  List<CartGoodsItem> cartGoods;

  CartGoodsEntity({this.cartGoods});

  CartGoodsEntity.fromJson(Map<String, dynamic> json) {
    if (json['cartGoods'] != null) {
      cartGoods = new List<CartGoodsItem>();
      (json['cartGoods'] as List).forEach((v) {
        cartGoods.add(new CartGoodsItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartGoods != null) {
      data['cartGoods'] = this.cartGoods.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartGoodsItem {
  int id;
  int quantity;
  int price;
  int market_price;
  String picUrl;
  String title;
  String model;

  CartGoodsItem(
      {this.id,
      this.quantity,
      this.price,
      this.market_price,
      this.picUrl,
      this.title,
      this.model});

  CartGoodsItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    market_price = json['market_price'];
    picUrl = json['pic_url'];
    title = json['title'];
    model = json['model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['pic_url'] = this.picUrl;
    data['title'] = this.title;
    data['market_price'] = this.market_price;
    data['model'] = this.model;
    return data;
  }
}
