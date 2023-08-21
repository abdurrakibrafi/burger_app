

import 'package:burgerapp/models/burger_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<BurgerModel>itemBag=[
   
];

class ItemBagNotifyer extends StateNotifier<List<BurgerModel>>{
  ItemBagNotifyer (): super(itemBag);

// add item
  void addNewItemBag(BurgerModel productModel){
    state =[
      ...state,productModel
    ];

 
  
  }
 //remove item
 void removeItem(int bid){
  state=[
    for (final product in state)
    if(product.bid != bid)product,
  ];
 }

}


final itemBagPorvider = StateNotifierProvider<ItemBagNotifyer,List<BurgerModel>>((ref) {
  return ItemBagNotifyer();
});


final priceCalcProvider = StateProvider<double>((ref) {
  final itemBag = ref.watch(itemBagPorvider);

  double sum = 0;
  for (var element in itemBag) {
    sum += element.price;
  }
  return sum;
});