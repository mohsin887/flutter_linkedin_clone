import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_clone/utils/sized_utils.dart';
import 'package:linkedin_clone/values/text_style.dart';
import 'package:linkedin_clone/widget/button/text_button_normal.dart';
import 'package:linkedin_clone/widget/button/text_icon_button.dart';
import 'package:linkedin_clone/widget/cachedNetwokImage/cached_network_image.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: CachedNetworkImageWidget(
              imageUrl:
                  'https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              'Iron Man',
              style: kLabelStyle,
            ),
            subtitle: Text(
              'View Profile',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ),
          SizedUtils.sizedBoxHeight5,
          const Divider(),
          TextButtonNormal(
            title: 'Groups',
            onPressed: () {},
          ),
          SizedUtils.sizedBoxHeight10,
          TextButtonNormal(
            title: 'Events',
            onPressed: () {},
          ),
          const Spacer(),
          const Divider(),
          SizedUtils.sizedBoxHeight10,
          TextIconButton(
            onPressed: () {},
            iconData: Icons.wallet_travel_rounded,
            title: 'Try Premium for free',
          ),
          SizedUtils.sizedBoxHeight10,
          TextIconButton(
            onPressed: () {},
            iconData: Icons.settings,
            title: 'Settings',
          ),
          SizedUtils.sizedBoxHeight10,
        ],
      ),
    );
  }
}
