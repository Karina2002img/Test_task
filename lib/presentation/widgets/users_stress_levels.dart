import 'package:flutter/material.dart';
import 'package:emotions_diary/presentation/widgets/custom_slider.dart';
import 'package:emotions_diary/utils/app_title.dart';

class UsersStressLevels extends StatefulWidget {
  const UsersStressLevels({super.key});

  @override
  UsersStressLevelsState createState() => UsersStressLevelsState();
}

class UsersStressLevelsState extends State<UsersStressLevels> {

  @override
  Widget build(BuildContext context) {
    return  CustomSlider(
      titleLevel: AppTitle.levelStress,
      titleStart: AppTitle.startStress,
      titleEnd: AppTitle.endStress,
    );
  }
}