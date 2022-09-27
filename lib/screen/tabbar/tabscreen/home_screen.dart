import 'package:flutter/material.dart';
import 'package:linkedin_clone/screen/home/user_card_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const UserCardWidget();
        },
        itemCount: 20,
      ),
    );
  }
}
