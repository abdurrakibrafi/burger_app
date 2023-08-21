import 'package:burgerapp/data/burger_list.dart';
import 'package:burgerapp/models/burger_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifyer extends StateNotifier<List<BurgerModel>> {
  ProductNotifyer() : super(burgerItems);


  // is selected 
   void isSelectedItem (int bid,int index){
     
    state = [
      for (final product in state)
      if (product.bid == bid)
      product.copyWith(isSelected: !state[index].isSelected)
      else
      product
    ];
   }


  void incrementQty (int pid){
    state=[
      for(final product in state)
      if (product.bid == pid)
      product.copyWith(qty: product.qty += 1)
      else
      product,
    ];
  }
   void descremetntQty (int pid){
    state=[
      for(final product in state)
      if (product.bid == pid)
      product.copyWith(qty: product.qty -= 1)
      else
      product,
    ];
  }
}

final ProductNotifyerProvider =
    StateNotifierProvider<ProductNotifyer, List<BurgerModel>>((ref) {
  return ProductNotifyer();
});
