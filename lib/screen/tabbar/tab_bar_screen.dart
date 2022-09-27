import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/screen/tabbar/tabscreen/home_screen.dart';
import 'package:linkedin_clone/screen/tabbar/tabscreen/job_screen.dart';
import 'package:linkedin_clone/screen/tabbar/tabscreen/my_network_screen.dart';
import 'package:linkedin_clone/screen/tabbar/tabscreen/notification_screen.dart';
import 'package:linkedin_clone/screen/tabbar/tabscreen/post_screen.dart';
import 'package:linkedin_clone/widget/appbar/drawer_app_bar.dart';

import '../../widget/drawer/drawer_widget.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _currentIndex = 0;
  bool isFirstTime = true;
  late List<Map<String, Object>> _pages;
  @override
  initState() {
    _pages = [
      {
        'page': const HomeScreen(),
      },
      {
        'page': const MyNetworkScreen(),
      },
      {
        'page': const PostScreen(),
      },
      {
        'page': const NotificationScreen(),
      },
      {
        'page': const JobScreen(),
      },
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: DrawerAppBar(controller: _controller),
      drawer: const DrawerWidget(),
      body: _pages[_currentIndex]['page'] as Widget,
      bottomNavigationBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_3),
            label: 'My Network',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.plus_app),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.bell,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.bag,
            ),
            label: 'Jobs',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _selectPage,
      ),
    );
  }
}
