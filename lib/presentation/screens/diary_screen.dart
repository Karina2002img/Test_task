import 'package:flutter/material.dart';
import 'package:emotions_diary/presentation/widgets/users_feeling.dart';
import 'package:emotions_diary/presentation/widgets/users_stress_levels.dart';
import 'package:emotions_diary/presentation/widgets/users_self.dart';
import 'package:emotions_diary/presentation/widgets/users_notes.dart';
import 'package:emotions_diary/presentation/widgets/custom_button.dart';
import 'package:emotions_diary/domain/controller/diary_controller.dart';


class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  DiaryScreenState createState() => DiaryScreenState();
}

class DiaryScreenState extends State<DiaryScreen> {
  final DiaryController _diaryController = DiaryController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _diaryController,
      builder: (context, _) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UsersFeeling(onUpdate: _diaryController.updateFeelingState),
              const UsersStressLevels(),
              const UsersSelf(),
              UsersNotes(controller: _diaryController.notesController),
              CustomButton(
                isActive: _diaryController.isButtonEnabled,
                onPressed: () {
                  // Handle button press action
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _diaryController.dispose();
    super.dispose();
  }
}
