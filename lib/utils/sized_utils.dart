import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizedUtils {
  static Widget sizedBoxHeight30 = SizedBox(
    height: ScreenUtil().setHeight(30),
  );
  static Widget sizedBoxHeight20 = SizedBox(
    height: ScreenUtil().setHeight(20),
  );
  static Widget sizedBoxHeight15 = SizedBox(
    height: ScreenUtil().setHeight(15),
  );
  static Widget sizedBoxHeight10 = SizedBox(
    height: ScreenUtil().setHeight(10),
  );
  static Widget sizedBoxHeight5 = SizedBox(
    height: ScreenUtil().setHeight(5),
  );

  static Widget sizedBoxWidth5 = SizedBox(
    width: ScreenUtil().setHeight(5),
  );
  static Widget sizedBoxWidth10 = SizedBox(
    width: ScreenUtil().setHeight(10),
  );
  static Widget sizedBoxWidth15 = SizedBox(
    width: ScreenUtil().setHeight(15),
  );
  static Widget sizedBoxWidth20 = SizedBox(
    width: ScreenUtil().setHeight(20),
  );
}
