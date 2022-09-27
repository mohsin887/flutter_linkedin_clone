import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_clone/screen/home/user_card_icon_widget.dart';
import 'package:linkedin_clone/utils/sized_utils.dart';
import 'package:linkedin_clone/values/text_style.dart';
import 'package:linkedin_clone/widget/cachedNetwokImage/cached_network_image.dart';
import 'package:linkedin_clone/widget/theme/widget/app_theme.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final color = appTheme.color;
    final typography = appTheme.typography;
    return Card(
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
            leading: const CachedNetworkImageWidget(
              imageUrl:
                  'https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MRS Tech', style: kLabelStyle),
                Text('467383 followers', style: mLabelStyle),
                Text('Promoted', style: mLabelStyle),
              ],
            ),
          ),
          Text(
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ',
            style: mLabelStyle,
            maxLines: 2,
          ),
          SizedUtils.sizedBoxHeight10,
          CachedNetworkImage(
            imageUrl:
                'https://images.unsplash.com/photo-1661956600684-97d3a4320e45?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
            placeholder: (context, url) => CupertinoActivityIndicator(
              color: color.primary.primary,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.image),
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      CupertinoIcons.hand_thumbsup,
                      color: color.primary.primary,
                      size: 12.sp,
                    ),
                    Positioned(
                      left: 10,
                      child: Icon(
                        Icons.favorite,
                        color: color.primary.secondary,
                        size: 12.sp,
                      ),
                    ),
                  ],
                ),
                SizedUtils.sizedBoxWidth10,
                Text(
                  'Jon and 56 others',
                  style: mLabelStyle,
                ),
                const Spacer(),
                Text(
                  '1 share',
                  style: mLabelStyle,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconWidget(
                title: 'Like',
                icon: CupertinoIcons.hand_thumbsup,
                onPressed: () {},
              ),
              IconWidget(
                onPressed: () {},
                title: 'Comment',
                icon: CupertinoIcons.chat_bubble_text,
              ),
              IconWidget(
                onPressed: () {},
                title: 'Share',
                icon: CupertinoIcons.arrowshape_turn_up_right,
              ),
              IconWidget(
                onPressed: () {},
                title: 'Send',
                icon: CupertinoIcons.location_fill,
              ),
            ],
          ),
          SizedUtils.sizedBoxHeight10,
        ],
      ),
    );
  }
}
