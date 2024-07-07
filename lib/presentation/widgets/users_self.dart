import 'package:flutter/material.dart';
import 'package:emotions_diary/presentation/widgets/custom_slider.dart';
import 'package:emotions_diary/utils/app_title.dart';

class UsersSelf extends StatefulWidget {
  const UsersSelf({super.key});

  @override
  UsersSelfState createState() => UsersSelfState();
}

class UsersSelfState extends State<UsersSelf> {

  @override
  Widget build(BuildContext context) {
    return  CustomSlider(
      titleLevel: AppTitle.levelSelf,
      titleStart: AppTitle.startSelf,
      titleEnd: AppTitle.endSelf,
    );
  }
}