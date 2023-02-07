// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_introduction_app_ard_grup/components/crud_view/crud_view.dart';
import 'package:flutter_introduction_app_ard_grup/providers/main_page_view_provider.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';

import '../../models/list_view.model.dart';
import '../../widgets/customBottomNavigation.dart';
import '../list_view/list_view.dart';
import 'package:provider/provider.dart';

import '../other_widgets_view/other_widgets.view.dart';

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
    final mainViewProvider =
        Provider.of<MainPageViewProvider>(context, listen: false);

    mainViewProvider.initForm();
  }

  @override
  void dispose() {
    final mainViewProvider =
        Provider.of<MainPageViewProvider>(context, listen: false);
    mainViewProvider.pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainViewProvide = Provider.of<MainPageViewProvider>(context);

    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: mainViewProvide.pageController,
          onPageChanged: (index) {
            setState(() => mainViewProvide.setcurrentIndex = index);
          },
          children: <Widget>[
            OtherWidgetsView(),
            ListScreen(pageController: mainViewProvide.pageController!),
            CrudView(
                listElements: new ListViewModel(),
                pageController: mainViewProvide.pageController!),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        animationDuration: Duration(milliseconds: 350),
        selectedItemOverlayColor: APPColors.Main.blue,
        backgroundColor: APPColors.Main.white,
        selectedIndex: mainViewProvide.currentIndex,
        onItemSelected: (index) {
          setState(() => mainViewProvide.setcurrentIndex = index);
          mainViewProvide.pageController!.jumpToPage(index);
        },
        items: <CustomBottomNavigationBarItem>[
          /*-------------- Build tabs here -----------------*/
          CustomBottomNavigationBarItem(
              title: 'Widgetlar',
              icon: Icon(Icons.chat_bubble),
              activeColor: APPColors.Main.white,
              inactiveColor: APPColors.Main.grey),
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
        ],
      ),
    );
  }
}
