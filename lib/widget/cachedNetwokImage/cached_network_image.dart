import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  const CachedNetworkImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(100),
        child: CachedNetworkImage(
          width: 40.w,
          height: 40.h,
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          placeholder: (context, url) => const CupertinoActivityIndicator(
            color: Colors.blue,
          ),
          errorWidget: (context, url, error) => const CircleAvatar(
            radius: 12,
            child: Icon(Icons.image),
          ),
        ),
      ),
    );
  }
}
