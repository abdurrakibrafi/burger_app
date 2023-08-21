import 'package:burgerapp/controllers/burger_controller.dart';
import 'package:burgerapp/controllers/itembag_controller.dart';
import 'package:burgerapp/models/burger_model.dart';
import 'package:burgerapp/pages/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsOfBurger extends ConsumerWidget {
  DetailsOfBurger({super.key, required this.burgerIndex});

  final int burgerIndex;

  int index = 0;
  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final product = ref.watch(ProductNotifyerProvider);
    final items = <Widget>[
      Icon(Icons.chat_bubble_outline, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.shopping_cart_outlined, size: 30),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 65,
        backgroundColor: Color(0xFFFF7A21),
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.arrow_back,
              size: 36,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 12),
            child: Badge(
              // label: Text(itemBag.length.toString()),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.50,
              color: Color(0xFFFF7A21),
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(product[burgerIndex].imgUrl),
                width: 260,
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70),
                      ),
                      color: Colors.white,
                      border: Border.all(
                          width: 3,
                          color: Colors.white,
                          style: BorderStyle.solid)),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: Text('')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 318.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(''),
                      Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(2, 6),
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 3)
                            ],
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              '\$${(product[burgerIndex].price * product[burgerIndex].qty)}',
                              style: TextStyle(
                                  color: Color(0xFFFF7A21),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('⭐⭐⭐⭐⭐'),
                            Text(
                              product[burgerIndex].burgerName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  letterSpacing: 1.2),
                            ),
                            Text(product[burgerIndex].cookingTime),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.87,
                                child:
                                    Text(product[burgerIndex].longDescription))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nutration Quality',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(product[burgerIndex].prothin,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        letterSpacing: 0.8)),
                                Text(
                                  "Prothin",
                                  style: TextStyle(color: Color(0xFFFF7A21)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(product[burgerIndex].caluries,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        letterSpacing: 0.8)),
                                Text(
                                  "Caluries",
                                  style: TextStyle(color: Color(0xFFFF7A21)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(product[burgerIndex].sadium,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        letterSpacing: 0.8)),
                                Text(
                                  "Sadium",
                                  style: TextStyle(color: Color(0xFFFF7A21)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(2, 6),
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 10,
                                            spreadRadius: 3)
                                      ],
                                      borderRadius: BorderRadius.circular(40),
                                      color: Color(0xFFFF7A21),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              ref
                                                  .read(ProductNotifyerProvider
                                                      .notifier)
                                                  .descremetntQty(
                                                      product[burgerIndex].bid);
                                            },
                                            icon: Icon(
                                              Icons.do_not_disturb_on_outlined,
                                              size: 30,
                                              color: Colors.white,
                                            )),
                                        Text(
                                          product[burgerIndex].qty.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              ref
                                                  .read(ProductNotifyerProvider
                                                      .notifier)
                                                  .incrementQty(
                                                      product[burgerIndex].bid);
                                            },
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              size: 30,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                offset: const Offset(2, 6),
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                blurRadius: 10,
                                                spreadRadius: 1)
                                          ],
                                        ),
                                        child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                              primary: Color(0xFFFF7A21),
                                              textStyle: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 59, 34, 34))),
                                          onPressed: () {
                                            Fluttertoast.showToast(
                                                msg: 'Burger Add To Cart',
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.SNACKBAR,
                                                timeInSecForIosWeb: 10);
                                            ref
                                                .read(ProductNotifyerProvider
                                                    .notifier)
                                                .isSelectedItem(
                                                    product[burgerIndex].bid,
                                                    burgerIndex);

                                            if (product[burgerIndex]
                                                    .isSelected ==
                                                false) {
                                              ref
                                                  .read(
                                                      itemBagPorvider.notifier)
                                                  .addNewItemBag(BurgerModel(
                                                    bid: product[burgerIndex]
                                                        .bid,
                                                    imgUrl: product[burgerIndex]
                                                        .imgUrl,
                                                    burgerName:
                                                        product[burgerIndex]
                                                            .burgerName,
                                                    price: product[burgerIndex]
                                                        .price,
                                                    cookingTime:
                                                        product[burgerIndex]
                                                            .cookingTime,
                                                    rating: '',
                                                    longDescription: '',
                                                    prothin: '',
                                                    caluries: '',
                                                    sadium: '',
                                                  ));
                                            } else {
                                              ref
                                                  .read(
                                                      itemBagPorvider.notifier)
                                                  .removeItem(
                                                      product[burgerIndex].bid);
                                            }
                                          },
                                          icon: Icon(
                                            Icons.shopping_cart_outlined,
                                            color: Colors.white,
                                          ), //icon data for elevated button
                                          label: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                2, 15, 10, 15),
                                            child: Text(
                                              "Add To Cart",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ), //label text
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          color: Color(0xFFFF7A21),
          backgroundColor: Color(0xFFFF7A21),
          buttonBackgroundColor: Color(0xFFFF7A21),
          height: 55,
          items: items,
          index: index,
          onTap: (index) {},
        ),
      ),
    );
  }
}
