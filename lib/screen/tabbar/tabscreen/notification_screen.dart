import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_clone/values/text_style.dart';
import 'package:linkedin_clone/widget/cachedNetwokImage/cached_network_image.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return NotificationsCardWidget(
            iconOnPressed: () {},
            onPressed: () {},
            title: 'Iron Man',
            subTitle: 'View Profile',
            imageUrl:
                'https://images.unsplash.com/photo-1659535964542-63e75ddb28ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
          );
        },
      ),
    );
  }
}

class NotificationsCardWidget extends StatelessWidget {
  final Function() onPressed;
  final Function() iconOnPressed;
  final String title;
  final String imageUrl;
  final String subTitle;
  const NotificationsCardWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.imageUrl,
    required this.subTitle,
    required this.iconOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 12.0.r, top: 6.r),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  '18h',
                  style: mLabelStyle,
                ),
              ),
            ),
            ListTile(
              title: Text(
                title,
              ),
              subtitle: Text(
                subTitle,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              trailing: IconButton(
                onPressed: iconOnPressed,
                icon: const Icon(Icons.more_vert),
              ),
              leading: CachedNetworkImageWidget(imageUrl: imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}
