import 'package:burgerapp/pages/fav_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RaitigPage extends StatefulWidget {
  const RaitigPage({super.key});

  @override
  State<RaitigPage> createState() => _RaitigPageState();
}

class _RaitigPageState extends State<RaitigPage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rating and Reviews',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 63,
        backgroundColor: Color(0xFFFF7A21),
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),   
           onPressed: () {  Navigator.pop(context); }
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 12),
            child: Badge(
              // label: Text(itemBag.length.toString()),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyFavorite()));
                  },
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
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Customers Satisfiction',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '4.3',
                                  style: TextStyle(
                                      fontSize: 55,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('23 Raiting'),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '⭐⭐⭐⭐',
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('⭐⭐⭐'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('⭐⭐'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('⭐'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  new LinearPercentIndicator(
                                    width: 120.0,
                                    lineHeight: 11.0,
                                    percent: 0.9,
                                    progressColor: Color(0xFFFF7A21),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  new LinearPercentIndicator(
                                    width: 80.0,
                                    lineHeight: 11.0,
                                    percent: 0.7,
                                    progressColor: Color(0xFFFF7A21),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  new LinearPercentIndicator(
                                    curve: Curves.bounceInOut,
                                    width: 60.0,
                                    lineHeight: 11.0,
                                    percent: 0.4,
                                    progressColor: Color(0xFFFF7A21),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Row(
                                children: [
                                  new LinearPercentIndicator(
                                    curve: Curves.bounceInOut,
                                    width: 40.0,
                                    lineHeight: 11.0,
                                    percent: 0.2,
                                    progressColor: Color(0xFFFF7A21),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('12'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('5'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('3'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('1'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '8 Reviews',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: this.value,
                            onChanged: (bool? value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                          Text('With photo')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 350,
              padding: EdgeInsets.only(left: 25),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 300,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(2, 25, 0, 0),
                            child: Image(
                              image: AssetImage(
                                'images/download__2_-removebg-preview.png',
                              ),
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(22, 0, 0, 2),
                              child: Text(
                                'Rakib Rafi',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 0, 25, 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('⭐⭐⭐⭐'),
                                    Text('June 30,2023')
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(22, 2, 16, 10),
                              child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(''),
                              Padding(
                                padding: const EdgeInsets.only(left: 100.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Helpful',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Icon(
                                      Icons.thumb_up_alt_outlined,
                                      size: 20,
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  //2nd widget
                  Container(
                    width: 330,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(2, 10, 0, 0),
                            child: Image(
                              image: AssetImage(
                                'images/download__2_-removebg-preview.png',
                              ),
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(22, 0, 0, 2),
                              child: Text(
                                'Rakib Rafi',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 0, 25, 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('⭐⭐⭐⭐'),
                                    Text('June 30,2023')
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(22, 2, 16, 10),
                              child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(''),
                              Row(
                                children: [
                                  Text('Helpful'),
                                  Text('ok'),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(2, 6),
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2)
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 50,
              child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Color(0xFFFF7A21), // Background Color
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: ((context) {
                          return SingleChildScrollView(
                            child: Container(
                                height: 700,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 40, 0, 10),
                                            child: Text(
                                              'What is your rate?',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          RatingBar.builder(
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 50.0,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Please share your opinion',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            "about the product",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            height: 120,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.87,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText:
                                                      "Write your review"),
                                              maxLines: 10,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.85,
                                            height: 50,
                                            child: TextButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor: Color(
                                                      0xFFFF7A21), // Background Color
                                                ),
                                                onPressed: () {},
                                                child: Text('Submit',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          );
                        }));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        size: 25,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Write a review',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
