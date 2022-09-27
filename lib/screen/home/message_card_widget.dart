import 'package:flutter/material.dart';
import 'package:linkedin_clone/values/text_style.dart';

import '../../widget/cachedNetwokImage/cached_network_image.dart';

class MessageCardWidget extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final String subTitle;
  final String imageUrl;
  final DateTime time;
  const MessageCardWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              title,
              style: kLabelStyle,
            ),
            subtitle: Text(
              subTitle,
              style: mLabelStyle,
            ),
            leading: CachedNetworkImageWidget(imageUrl: imageUrl),
            trailing: Text(
              time.toString(),
              style: mLabelStyle,
            ),
          ),
        ),
      ),
    );
  }
}
