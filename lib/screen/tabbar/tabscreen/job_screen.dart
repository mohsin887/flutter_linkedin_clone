import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return JobCardWidget(
                title: 'title', subTitle: 'subTitle', onPressed: () {});
          }),
    );
  }
}

class JobCardWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function() onPressed;

  const JobCardWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                title,
              ),
              subtitle: Text(
                subTitle,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Colors.black45,
                  ),
                ),
                child: Image.network(
                  'https://images.unsplash.com/photo-1662581872342-3f8e0145668f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072&q=80',
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
