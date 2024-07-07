import 'package:flutter/material.dart';

class DiaryController extends ChangeNotifier {
  final TextEditingController notesController = TextEditingController();
  bool isButtonEnabled = false;
  bool isFeelingSelected = false;

  DiaryController() {
    notesController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    bool isNotesNotEmpty = notesController.text.isNotEmpty;
    isButtonEnabled = isNotesNotEmpty && isFeelingSelected;
    notifyListeners();
  }

  void updateFeelingState() {
    isFeelingSelected = true;
    _updateButtonState();
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }
}
