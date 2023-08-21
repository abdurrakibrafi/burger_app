import 'package:burgerapp/controllers/itembag_controller.dart';
import 'package:burgerapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccessPage extends ConsumerStatefulWidget {
  const PaymentSuccessPage({super.key});

  @override
  ConsumerState<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends ConsumerState<PaymentSuccessPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  get burgerIndex => null;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      //  if the full duration of the animation is 8 secs then 0.5 is 4 secs
      if (_controller.value > 0.9) {
// When it gets there hold it there.
        _controller.value = 0.9;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemBag = ref.watch(itemBagPorvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 50),
                child: Lottie.asset('animation/animation_lk6wzhdb.json',
                    controller: _controller, onLoaded: (comp) {
                  _controller
                    ..duration = comp.duration
                    ..forward();
                }, height: 400, width: 500, repeat: true, fit: BoxFit.cover),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 3),
                  child: Row(
                    children: [
                      Text(
                        'Thank you for your order',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 5, 3),
                  child: Row(
                    children: [
                      Text(
                        'You will receive an email at abdmail@gmail.com\nOnce your order is confirmed',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 245, 245, 245),
                  borderRadius: BorderRadius.circular(10)),
              height: 80,
              width: 320,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order Number'),
                      Text(
                        '#IC345763',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amount Paid',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${ref.watch(priceCalcProvider)}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              width: 320,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF7A21),
                    textStyle: TextStyle(
                        color: const Color.fromARGB(255, 59, 34, 34))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                //icon data for elevated button
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 15, 10, 15),
                  child: Text(
                    "Go To Home",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ), //label text
              ),
            )
          ],
        )),
      ),
    );
  }
}
