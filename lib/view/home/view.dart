import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/view/home/pages/favs/view.dart';
import 'package:thimar_app/view/home/pages/main/view.dart';
import 'package:thimar_app/view/home/pages/my_account/view.dart';
import 'package:thimar_app/view/home/pages/my_orders/view.dart';
import 'package:thimar_app/view/home/pages/notifications/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<Widget> pages = const [
    MainPage(),
    MyOrdersPage(),
    NotificationPage(),
    FavsPage(),
    MyAccountPage(),
  ];

  List<String> titles = [
    "الرئيسية",
    "طلباتي",
    "الإشعارات",
    "المفضلة",
    "حسابي",
  ];

  List<String> icons = [
    "home",
    "my_orders",
    "notification",
    "favs",
    "my_account",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xffAED489),
          items: List.generate(
            pages.length,
            (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/svg/${icons[index]}.svg",
                color: currentIndex == index ? Colors.white : const Color(0xffAED489),
              ),
              label: titles[index],
            ),
          )),
      body: pages[currentIndex],
    );
  }
}
