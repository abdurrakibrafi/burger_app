import 'package:burgerapp/pages/home_page.dart';
import 'package:burgerapp/pages/order_cart.dart';
import 'package:burgerapp/pages/raiting_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class ButtonNav extends StatefulWidget {
  const ButtonNav({super.key});

  @override
  State<ButtonNav> createState() => _ButtonNavState();
}

class _ButtonNavState extends State<ButtonNav> {

    int _selectedIndex = 0;

  final HomePage _homePage=new HomePage();
  final RaitigPage _raitigPage= new RaitigPage();
  final OrderCart _orderCart=new OrderCart(burgerIndex: null);

    Widget _showPage=new HomePage();
    Widget _pageChooser(int page){
      switch(page){
        case 0:
        return _homePage;
        break;
        case 1:
        return _raitigPage;
        break;
        case 2:
        return _orderCart;
        break;
        default:
        return Container(
          child: Text('No page'),
        );


      }
    }

     final items = <Widget>[
      Icon(Icons.chat_bubble_outline, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.shopping_cart_outlined, size: 30),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showPage,
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
            onTap: (int tappedIndex){
              _showPage=_pageChooser(tappedIndex);
            }),
      ),
    ) ;
  }
}