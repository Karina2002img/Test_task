import 'package:flutter/material.dart';

import 'package:emotions_diary/presentation/widgets/date_selection.dart';
import 'package:emotions_diary/presentation/widgets/custom_tab_bar.dart';

class EmotionsDiary extends StatefulWidget {
  const EmotionsDiary({super.key});

  @override
  State<EmotionsDiary> createState() => _EmotionsDiaryState();
}

class _EmotionsDiaryState extends State<EmotionsDiary> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const DateSelection(),
      ),
      body: const CustomTabBar(),
    );
  }
}


