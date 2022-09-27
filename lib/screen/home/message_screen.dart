import 'package:flutter/material.dart';
import 'package:linkedin_clone/screen/home/message_card_widget.dart';
import 'package:linkedin_clone/widget/appbar/cusom_app_bar.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Messages',
        action: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_list,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return MessageCardWidget(
            imageUrl:
                'https://images.unsplash.com/photo-1663697651653-68fe83aa6f30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80',
            title: 'Iron Man',
            subTitle: 'You have attached a file',
            time: DateTime.now(),
            onPressed: () {},
          );
        },
      ),
    );
  }
}
