import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ui/screens/account_page/account_page.dart';
import 'package:food_ui/screens/auth/sign_in_page.dart';
import 'package:food_ui/screens/auth/sign_up_page.dart';
import 'package:food_ui/screens/cart_history_page/cart_history_page.dart';
import 'package:food_ui/utils/colors.dart';
import 'components/main_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List page = [
    MainHomePage(),
    Container(child: Text("historycart"),),
    CartHistoryPage(),
    AccountPage(),
  ];


  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),

            label: "home",

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive),
            label: "date",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
            label: "cart history",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
            label: "me",
          ),
        ],
      ),
    );
  }


}
