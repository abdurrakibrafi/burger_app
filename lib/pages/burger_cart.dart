import 'package:burgerapp/controllers/burger_controller.dart';
import 'package:burgerapp/controllers/itembag_controller.dart';
import 'package:burgerapp/models/burger_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BurgerCartPage extends ConsumerWidget {
  const BurgerCartPage({super.key, required this.burgerCartIndex});

  final int burgerCartIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(ProductNotifyerProvider);
    return Hero(
      tag: product[burgerCartIndex].imgUrl,
      child: Container(
        padding: EdgeInsets.only(top: 12),
        alignment: Alignment.topLeft,
        width: 100,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: const Offset(2, 6),
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 1)
              ]),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image(
                            image: AssetImage(product[burgerCartIndex].imgUrl),
                            width: 110,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product[burgerCartIndex].rating,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    letterSpacing: 2.9,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                  width: 150,
                                  child: Text(
                                    product[burgerCartIndex].burgerName,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                                Text(
                                  product[burgerCartIndex].cookingTime,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 6, 25),
                                child: IconButton(
                                  onPressed: () {
                                    ref
                                        .read(ProductNotifyerProvider.notifier)
                                        .isSelectedItem(
                                            product[burgerCartIndex].bid,
                                            burgerCartIndex);

                                    if (product[burgerCartIndex].isSelected ==
                                        false) {
                                      ref
                                          .read(itemBagPorvider.notifier)
                                          .addNewItemBag(BurgerModel(
                                            bid: product[burgerCartIndex].bid,
                                            imgUrl:
                                                product[burgerCartIndex].imgUrl,
                                            burgerName: product[burgerCartIndex]
                                                .burgerName,
                                            price:
                                                product[burgerCartIndex].price,
                                            cookingTime:
                                                product[burgerCartIndex]
                                                    .cookingTime,
                                            rating: '',
                                            longDescription: '',
                                            prothin: '',
                                            caluries: '',
                                            sadium: '',
                                          ));
                                    } else {
                                      ref
                                          .read(itemBagPorvider.notifier)
                                          .removeItem(
                                              product[burgerCartIndex].bid);
                                    }
                                  },
                                  icon: Icon(
                                     product[burgerCartIndex].isSelected
                                ? Icons.favorite
                                    :Icons.favorite_border,
                                    size: 30,
                                    color: Color(0xFFFF7A21),
                                  ),
                                )),
                            Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                child: Text(
                                  '\$${product[burgerCartIndex].price}',
                                  style: TextStyle(
                                      color: Color(0xFFFF7A21),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
