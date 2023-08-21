import 'package:burgerapp/controllers/itembag_controller.dart';
import 'package:burgerapp/pages/payment_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentPage extends ConsumerWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        final itemBag = ref.watch(itemBagPorvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Option',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 25, 30, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Now Turn to select your payment option\nOrder almost complate',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Container(
                        width: 50,
                        height: 40,
                        color: Color.fromARGB(255, 245, 245, 245),
                        child: Icon(
                          Icons.close,
                          color: const Color.fromARGB(255, 245, 96, 96),
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Payment',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 245, 245),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(2, 6),
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 1)
                      ],
                    ),
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.credit_card,
                              size: 30.0,
                              color: Color(0xFFFF7A21),
                            ),
                            label: Text(
                              'Add New Card',
                              style: TextStyle(
                                  fontSize: 15.5, color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 24.0,
                              color: Colors.black,
                            ),
                            label: Text(''),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    child: Text(
                      'Payment Options',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          child: Expanded(
                              flex: 3,
                              child: Container(
                                color: Colors.white,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: SafeArea(
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(6, 6),
                                            color:
                                                Colors.black.withOpacity(0.12),
                                            blurRadius: 10,
                                            spreadRadius: 4)
                                      ],
                                    ),
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Image.asset(
                                              'images/pytham-removebg-preview.png',
                                              width: 50,
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
                                                    'Paytm Pay',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Container(
                          height: 120,
                          child: Expanded(
                              flex: 3,
                              child: Container(
                                color: Colors.white,
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                child: SafeArea(
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(6, 6),
                                            color:
                                                Colors.black.withOpacity(0.12),
                                            blurRadius: 10,
                                            spreadRadius: 4)
                                      ],
                                    ),
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Image.asset(
                                              'images/Gpay-removebg-preview.png',
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
                                                    'Google Pay',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 320,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Wallet Balance',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),),
                       Container(
                        padding: EdgeInsets.all(10),
                         color: Color.fromARGB(255, 245, 245, 245),
                         child: Row(
                          children: [
                           Container(
                            padding: EdgeInsets.all(2),
                            child: Icon(Icons.add_circle,size: 25,color: Color(0xFFFF7A21),)),
                            Text('Add Cash',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                          ],
                         ),
                       )
                    ],
                  ),
                  Text('USD 2,400.00',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Column(
              children: [
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
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentSuccessPage()));
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
