class BurgerModel {
  final int bid;
  final String imgUrl;
  final String burgerName;
  final String rating;
  final double price;
  final String cookingTime;
  final String longDescription;
  final String prothin;
  final String caluries;
  final String sadium;
  int qty;
  bool isSelected;

  BurgerModel({
    required this.bid,
    required this.imgUrl,
    required this.burgerName,
    required this.rating,
    required this.price,
    required this.cookingTime,
    required this.longDescription,
    required this.prothin,
    required this.caluries,
    required this.sadium,
    this.isSelected=false,
    this.qty=1,
  });
  BurgerModel copyWith({
    int? bid,
    String? imgUrl,
    String?burgerName,
    String ?rating,
    double?price,
    String ? cookingTime,
    String ? longDescription,
    String ? prothin,
    String ? caluries,
    String ? sadium,
     bool? isSelected,
    int? qty,
  }){
    return BurgerModel(
      bid: bid ?? this.bid,
       imgUrl:imgUrl ?? this.imgUrl,
       burgerName: burgerName ?? this.burgerName,
       rating: rating?? this.rating,
       price: price?? this.price,
       cookingTime: cookingTime?? this.cookingTime,
       longDescription: longDescription?? this.longDescription,
       prothin: prothin?? this.prothin,
       caluries: caluries?? this.caluries,
       sadium: sadium??this.sadium,
       isSelected: isSelected?? this.isSelected,
      qty: qty ?? this.qty,
    );
  }

}