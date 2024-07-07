import 'package:flutter/material.dart';
import 'package:emotions_diary/utils/custom_colors.dart';

class CustomButton extends StatefulWidget {
  final bool isActive;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.isActive,
    required this.onPressed,
  });

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isActive ? () {
        widget.onPressed();
        _showSnackbar(context);
      } : null,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (widget.isActive) {
            return CustomColors.tangerineColor;
          }
          return CustomColors.gray4;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (widget.isActive) {
            return Colors.white;
          }
          return CustomColors.gray2;
        }),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        child: Text(
          'Сохранить',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Данные сохранены'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
