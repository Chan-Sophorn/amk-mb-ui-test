import 'package:amk_mobile/constants/app_color.dart';
import 'package:flutter/material.dart';

class TermConditionView extends StatelessWidget {
  final String title;
  const TermConditionView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        children: [
          Center(child: Text("Term Condition"),)
        ],
      ),
    );
  }
}