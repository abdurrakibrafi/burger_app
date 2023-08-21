import 'package:burgerapp/controllers/itembag_controller.dart';
import 'package:burgerapp/data/burger_list.dart';
import 'package:burgerapp/drawer/header_drawer.dart';
import 'package:burgerapp/models/burger_model.dart';
import 'package:burgerapp/models/user_model.dart';
import 'package:burgerapp/pages/burger_cart.dart';
import 'package:burgerapp/pages/burger_details.dart';
import 'package:burgerapp/pages/fav_page.dart';
import 'package:burgerapp/pages/intro_pages.dart';
import 'package:burgerapp/pages/order_cart.dart';
import 'package:burgerapp/pages/raiting_page.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerStatefulWidget {
  HomePage({
    super.key,
  });

  late int? burgerIndex;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  //Drawer
  var currentPage;

  int _selectedIndex = 0;

  int index = 0;
  void _onItemTapped(index) {
    _selectedIndex = index;
    setState(() {
      this.index = index;
    });

    // You can define your own logic here to navigate to different page routes
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RaitigPage()));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderCart(
                      burgerIndex: index,
                    )));

        break;

      default:
    }
  }
//searching method
  List<BurgerModel> display_list = List.from(burgerItems);
  void updateList(String value) {
    setState(() {
      display_list = burgerItems
          .where((element) =>
              element.burgerName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  final screen = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final itemBag = ref.watch(itemBagPorvider);
    //for drawer navigate we apply the condition
    var container;
    if (currentPage == DrawerSection.dashborad) {
    } else if (currentPage == DrawerSection.settings) {
    } else if (currentPage == DrawerSection.notes) {
    } else if (currentPage == DrawerSection.notification) {
    } else if (currentPage == DrawerSection.logout) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => IntroPage(),
            ));
      });
    }

    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.chat_bubble_outline, size: 30),
      Icon(Icons.shopping_cart_outlined, size: 30),
    ];
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xFFFF7A21),
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
            child: Icon(
              Icons.clear_all,
              size: 36,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            } else {
              scaffoldKey.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 12),
            child: Badge(
              label: Text(itemBag.length.toString()),
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
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                MyDrwerHerader(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    ),
                    color: Color(0xFFFF7A21),
                    border: Border.all(
                        width: 3,
                        color: Color(0xFFFF7A21),
                        style: BorderStyle.solid)),
                height: MediaQuery.of(context).size.height * 0.35,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 19.0),
                              child: Text(
                                'Hello 😀',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 2.9,
                                    fontFamily: 'Lobster'),
                              ),
                            ),
                            Container(
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Text(
                                  "${loggedInUser.firstName} ${loggedInUser.secondName}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Text(
                                "Let's get your order__",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image(
                      image:
                          AssetImage('images/burger_logu-removebg-preview.png'),
                      width: 200,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 190, 20, 20),
                  width: 320,
                  child: TextField(
                    onChanged: updateList,
                    decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: 'Search your burger',
                        suffixIcon: Icon(
                          Icons.search,
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
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.97,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 80.0, 200, 5),
                          child: Column(
                            children: [
                              Text(
                                'Select Your Catagory',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 600,
                          child: DefaultTabController(
                            length: 5,
                            child: Column(
                              children: <Widget>[
                                ButtonsTabBar(
                                  radius: 8.0,
                                  borderWidth: 50.8,
                                  backgroundColor: Color(0xFFFF7A21),
                                  unselectedBackgroundColor:
                                      Color.fromARGB(255, 223, 219, 219),
                                  unselectedLabelStyle:
                                      TextStyle(color: Color(0xFFFF7A21)),
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                  tabs: [
                                    Tab(
                                      iconMargin: EdgeInsets.all(66),
                                      icon: FaIcon(
                                        FontAwesomeIcons.burger,
                                        size: 35,
                                      ),
                                      text: "Humburger",
                                    ),
                                    Tab(
                                      icon: Icon(
                                        Icons.lunch_dining,
                                        size: 35,
                                      ),
                                      text: "Kubie Burger",
                                    ),
                                    Tab(
                                      icon: Icon(
                                        Icons.fastfood,
                                        size: 35,
                                      ),
                                      text: "Olive burger",
                                    ),
                                    Tab(
                                      icon: Icon(
                                        Icons.no_food,
                                        size: 35,
                                      ),
                                      text: "Slaw burger",
                                    ),
                                    Tab(
                                      iconMargin: EdgeInsets.all(66),
                                      icon: FaIcon(
                                        FontAwesomeIcons.burger,
                                        size: 35,
                                      ),
                                      text: "Chessburger",
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        width: double.infinity,
                                        child: display_list.length ==0 ? Column(
                                          children: [
                                            SizedBox(
                                              height: 130,
                                            ),
                                            Center(child: Icon(Icons.info_outline_rounded,size: 55,color: Colors.grey,)),
                                            Center(child: Text('No result Found',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),),
                                          ],
                                        ):
                                        ListView.builder(
                                          // padding: EdgeInsets.all(8),
                                          itemCount: display_list.length,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailsOfBurger(
                                                            burgerIndex: index,
                                                          )));
                                            },
                                            child: BurgerCartPage(
                                                burgerCartIndex: index),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        width: double.infinity,
                                        child: ListView.builder(
                                          // padding: EdgeInsets.all(8),
                                          itemCount: 3,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailsOfBurger(
                                                            burgerIndex: index,
                                                          )));
                                            },
                                            child: BurgerCartPage(
                                                burgerCartIndex: index),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        width: double.infinity,
                                        child: ListView.builder(
                                          // padding: EdgeInsets.all(8),
                                          itemCount: 2,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailsOfBurger(
                                                            burgerIndex: index,
                                                          )));
                                            },
                                            child: BurgerCartPage(
                                                burgerCartIndex: index),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        width: double.infinity,
                                        child: ListView.builder(
                                          // padding: EdgeInsets.all(8),
                                          itemCount: 1,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailsOfBurger(
                                                            burgerIndex: index,
                                                          )));
                                            },
                                            child: BurgerCartPage(
                                                burgerCartIndex: index),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
            color: Color(0xFFFF7A21),
            backgroundColor: Color(0xFFFF7A21),
            buttonBackgroundColor: Color(0xFFFF7A21),
            height: 55,
            items: items,
            index: _selectedIndex,
            onTap: _onItemTapped),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          menuItem(1, 'Edit Profile', Icons.person_add,
              currentPage == DrawerSection.dashborad ? true : false),
          SizedBox(
            height: 4,
          ),
          menuItem(2, 'Purchase History', Icons.attach_money,
              currentPage == DrawerSection.settings ? true : false),
          SizedBox(
            height: 4,
          ),
          menuItem(3, 'About Us', Icons.info,
              currentPage == DrawerSection.notes ? true : false),
          SizedBox(
            height: 4,
          ),
          menuItem(4, 'Settings', Icons.settings,
              currentPage == DrawerSection.notification ? true : false),
          SizedBox(
            height: 4,
          ),
          menuItem(5, 'Log Out', Icons.do_not_disturb_off,
              currentPage == DrawerSection.logout ? true : false),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
        child: InkWell(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          if (id == 1) {
            currentPage = DrawerSection.dashborad;
          } else if (id == 2) {
            currentPage = DrawerSection.settings;
          } else if (id == 3) {
            currentPage = DrawerSection.notes;
          } else if (id == 4) {
            currentPage = DrawerSection.notification;
          } else if (id == 5) {
            currentPage = DrawerSection.logout;
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
                child: Icon(
              icon,
              size: 30,
              color: Color(0xFFFF7A21),
            )),
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ))
          ],
        ),
      ),
    ));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => IntroPage()));
  }
}

enum DrawerSection { dashborad, settings, notes, notification, logout }
