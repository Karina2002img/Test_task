import 'package:flutter/material.dart';
import 'package:emotions_diary/utils/custom_colors.dart';
import 'package:emotions_diary/utils/app_title.dart';

class UsersNotes extends StatelessWidget {
  final TextEditingController controller;

  const UsersNotes({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTitle.notesTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: controller,
          maxLines: 3,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: CustomColors.customBlack),
          decoration: InputDecoration(
            hintText: AppTitle.inputTitle,
            hintStyle: Theme.of(context).textTheme.labelSmall,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
