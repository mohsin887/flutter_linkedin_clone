import 'package:flutter/material.dart';
import 'package:linkedin_clone/screen/home/message_screen.dart';
import 'package:linkedin_clone/widget/cachedNetwokImage/cached_network_image.dart';

class DrawerAppBar extends StatelessWidget with PreferredSizeWidget {
  const DrawerAppBar({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          fillColor: Colors.black12,
          filled: true,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search_rounded,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const MessageScreen();
                },
              ),
            );
          },
          icon: const Icon(
            Icons.message,
            color: Colors.black45,
          ),
        )
      ],
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const CachedNetworkImageWidget(
              imageUrl:
                  'https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
