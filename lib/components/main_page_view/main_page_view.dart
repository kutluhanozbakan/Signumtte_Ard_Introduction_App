// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_introduction_app_ard_grup/components/crud_view/crud_view.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';

import '../../widgets/customBottomNavigation.dart';
import '../list_view/list_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            /*-------------- Build tab content here -----------------*/

            ListScreen(),
            CrudView(),
            Center(
              child: Text("Bottom Navigation",
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        animationDuration: Duration(milliseconds: 350),
        selectedItemOverlayColor: APPColors.Main.blue,
        backgroundColor: APPColors.Main.white,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController!.jumpToPage(index);
        },
        items: <CustomBottomNavigationBarItem>[
          /*-------------- Build tabs here -----------------*/
          CustomBottomNavigationBarItem(
              title: 'Listeleme',
              icon: Icon(Icons.home),
              activeColor: APPColors.Main.white,
              inactiveColor: APPColors.Main.grey),
          CustomBottomNavigationBarItem(
              title: 'CRUD',
              icon: Icon(Icons.apps),
              activeColor: APPColors.Main.white,
              inactiveColor: APPColors.Main.grey),
          CustomBottomNavigationBarItem(
              title: 'Widgetlar',
              icon: Icon(Icons.chat_bubble),
              activeColor: APPColors.Main.white,
              inactiveColor: APPColors.Main.grey),
        ],
      ),
    );
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
