import 'package:burgerapp/controllers/itembag_controller.dart';
import 'package:burgerapp/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AddressBook extends ConsumerStatefulWidget {
  const AddressBook({super.key});

  @override
  ConsumerState<AddressBook> createState() => _AddressBookState();
}

class _AddressBookState extends ConsumerState<AddressBook> {
  Position? _currentPosition;
  String? _currentAddress;
  bool isLoading = false;

  Future<Position> _getPosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location not found');
      }
    } else {
      print('Location not found');
    }
    return await Geolocator.getCurrentPosition();
  }

  void _getAddress(latitude, longitude) async {
    try {
      List<Placemark> placemark = await GeocodingPlatform.instance
          .placemarkFromCoordinates(latitude, longitude);

      Placemark place = placemark[0];

      setState(() {
        _currentAddress = 'Area Location: ${place.locality}, House & Road No: ${place.street},${place.country}';
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final itemBag = ref.watch(itemBagPorvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Address",
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
              height: 520,
              padding: EdgeInsets.fromLTRB(30, 25, 30, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Order in on going almost\nAdd your address',
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
                      'Delivery',
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
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              _currentPosition = await _getPosition();
                              _getAddress(_currentPosition!.latitude, _currentPosition!.longitude);
                              setState(() {
                                isLoading = false;
                              });
                            },
                            icon: Icon(
                              Icons.location_on_outlined,
                              size: 30.0,
                              color: Color(0xFFFF7A21),
                            ),
                            label: Text(
                              'Get Your Current Location',
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
                      'Your Addresses',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 245, 245),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(2, 6),
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 4)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.home_outlined,
                                size: 35,
                                color: Color(0xFFFF7A21),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 175),
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Icon(
                                Icons.more_vert_sharp,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(23, 0, 20, 20),
                          child: Column(
                            children: [
                              if (_currentAddress != null)
                              Text(
                        _currentAddress!,
                            style: TextStyle(
                                color: const Color.fromARGB(215, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                            ],
                          )
                          
                          
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 245, 245),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(2, 6),
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 4)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.home_work_outlined,
                                size: 35,
                                color: Color(0xFFFF7A21),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 175),
                                  child: Text(
                                    'Office',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Icon(
                                Icons.more_vert_sharp,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(23, 0, 20, 20),
                          child:  Column(
                            children: [
                              if (_currentAddress != null)
                              Text(
                        _currentAddress!,
                            style: TextStyle(
                                color: const Color.fromARGB(215, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
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
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PaymentPage()));
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
