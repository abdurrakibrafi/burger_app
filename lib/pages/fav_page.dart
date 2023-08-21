import 'package:burgerapp/controllers/itembag_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyFavorite extends ConsumerStatefulWidget {
  const MyFavorite({super.key});

  @override
  ConsumerState<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends ConsumerState<MyFavorite> {
  @override
  Widget build(BuildContext context) {
    final itemBag = ref.watch(itemBagPorvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Favourite',
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 0, 7),
                      child: Text(
                        'Your Favourite Item',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                    Stack(
                      children: [
                        if (itemBag == null || itemBag.isEmpty)
                          Container(
                            height: 420,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 98.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.boxOpen,
                                      size: 75,
                                      color: Colors.black38,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'Opps,Your favorite item is empty!',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'To add your favorite item please',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                     Text('Visit our dashboard',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                                  ],
                                ),
                              ),
                            ),
                          )
                        else
                          Container(
                            height: 420,
                            child: Expanded(
                                flex: 5,
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
                                                      offset:
                                                          const Offset(2, 6),
                                                      color: Colors.black
                                                          .withOpacity(0.2),
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
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              itemBag[index]
                                                                  .burgerName,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20),
                                                            ),
                                                            Text(
                                                              itemBag[index]
                                                                  .cookingTime,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 14),
                                                            ),
                                                            SizedBox(
                                                              height: 4,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '\$${itemBag[index].price}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Color(
                                                                0xFFFF7A21)),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                )),
                          ),
                      ],
                    ),
                    //  Container(
                    //   height: 420,
                    //    child: Expanded(
                    //       flex: 5,
                    //           child: Container(

                    //             color: Colors.white,
                    //             width: double.infinity,
                    //             padding: EdgeInsets.all(20),
                    //             child: ListView.builder(
                    //                 itemCount: itemBag.length,
                    //                 itemBuilder: (context, index) => SafeArea(
                    //                       child: Container(

                    //                         padding: EdgeInsets.all(20),
                    //                         decoration: BoxDecoration(
                    //                           color: Colors.white,
                    //                           boxShadow: [
                    //                             BoxShadow(
                    //                                 offset: const Offset(2, 6),
                    //                                 color:
                    //                                     Colors.black.withOpacity(0.2),
                    //                                 blurRadius: 10,
                    //                                 spreadRadius: 3)
                    //                           ],
                    //                         ),
                    //                         width: double.infinity,
                    //                         child: Row(
                    //                           children: [
                    //                             Expanded(
                    //                                 flex: 1,
                    //                                 child: Image.asset(
                    //                                   itemBag[index].imgUrl,
                    //                                   width: 20,
                    //                                 )),
                    //                             Expanded(
                    //                                 flex: 1,
                    //                                 child: Padding(
                    //                                   padding:
                    //                                       const EdgeInsets.symmetric(
                    //                                           horizontal: 10),
                    //                                   child: Column(
                    //                                     crossAxisAlignment:
                    //                                         CrossAxisAlignment.start,
                    //                                     children: [
                    //                                       Text(
                    //                                         itemBag[index].burgerName,
                    //                                         style: TextStyle(
                    //                                             fontWeight:
                    //                                                 FontWeight.bold,
                    //                                             fontSize: 20),
                    //                                       ),
                    //                                       Text(
                    //                                        itemBag[index].cookingTime,
                    //                                         style: TextStyle(
                    //                                             color: Colors.grey,
                    //                                             fontSize: 14),
                    //                                       ),
                    //                                       SizedBox(
                    //                                         height: 4,
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                 )),
                    //                             Row(
                    //                               children: [
                    //                                 Text(
                    //                                   '\$${itemBag[index].price}',
                    //                                   style: TextStyle(
                    //                                       fontWeight: FontWeight.bold,
                    //                                       fontSize: 20,
                    //                                       color: Color(0xFFFF7A21)),
                    //                                 )
                    //                               ],
                    //                             )
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     )),
                    //           )),
                    //  ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Container(
              width: 320,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(2, 6),
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 1)
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFF7A21),
                      textStyle: TextStyle(
                          color: const Color.fromARGB(255, 59, 34, 34))),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                  },
                  //icon data for elevated button
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 15, 10, 15),
                    child: Text(
                      "Add All To Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ), //label text
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
