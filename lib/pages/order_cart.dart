import 'package:burgerapp/controllers/burger_controller.dart';
import 'package:burgerapp/controllers/itembag_controller.dart';
import 'package:burgerapp/pages/address_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderCart extends ConsumerWidget {
  

  int? burgerIndex;

 OrderCart({super.key, required this.burgerIndex,});
   

  


  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final itemBag = ref.watch(itemBagPorvider);
      final product = ref.watch(ProductNotifyerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
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
          onPressed: () {  Navigator.pop(context); },
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
        child: Column(
          children: [
            Container(
              height: 380,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 0, 7),
                      child: Text(
                        'Your Order Item',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          child: ListView.builder(
                              itemCount: itemBag.length,
                              itemBuilder: (context, index) => SafeArea(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(2, 6),
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              blurRadius: 10,
                                              spreadRadius: 3)
                                        ],
                                      ),
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Image.asset(
                                               itemBag[index].imgUrl,
                                                width: 20,
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      itemBag[index].burgerName,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      itemBag[index].cookingTime,
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          Column(
                                            children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(255, 245, 245, 245),
                                                    borderRadius: BorderRadius.circular(10)),
                                                  height: 40,
                                                 
                                                  child: IconButton(
                                                    onPressed: (){
                                                         ref
                                                  .read(
                                                      itemBagPorvider.notifier)
                                                  .removeItem(
                                                      product[burgerIndex!].bid);
                                        
                               
                                                    },
                                                    icon: Icon(Icons.do_not_disturb_on_outlined,size: 30,color: Colors.red,))),
                                                SizedBox(height: 20),
                                              Row(
                                                children: [
                                                 
                                                  Text(
                                                     '\$${itemBag[index].price}',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Color(0xFFFF7A21)),
                                                  ),
                                                  
                                                ],
                                              
                                              ),
                                             

                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                        )),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 0, 7),
                      child: Text(
                        'Your Coupone Code',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 5, 20, 20),
                      width: 320,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true, //<-- SEE HERE
                            fillColor: Color.fromARGB(255, 245, 245, 245),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            hintText: 'Apply your coupone code',
                            suffixIcon: Icon(
                              Icons.sell,
                              color: Color(0xFFFF7A21),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                            )),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 245, 245, 245),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        width: 320,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '54\$',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 320,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount Fee',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              '43%',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 320,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Charge',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              '67\$',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Do you want to more items?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Add item",
                      style: TextStyle(
                          color: Color(0xFFFF7A21),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  height: 70,
                  color: Color(0xFFFF7A21),
                  width: double.infinity,
                  child: Container(
                    width: 320,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              color: Color.fromARGB(255, 245, 245, 245),
                              width: MediaQuery.of(context).size.width * 0.60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 0, 0),
                                      width: 200,
                                      child: Text('Total Order',
                                          style: TextStyle(fontSize: 16))),
                                  Container(
                                      width: 250,
                                      padding: EdgeInsets.fromLTRB(40, 0, 0, 1),
                                      child: Text(
                                         '\$${ref.watch(priceCalcProvider)}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddressBook()));
                                      },
                                      child: Text(
                                        'Pay Now',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
