import 'package:flutter/material.dart';

class ContainerEmotions extends StatefulWidget {
  final String pathImages;
  final String titleEmotions;
  final bool isSelected;
  final Function() onTap;
  final List<String> additionalTexts;

  const ContainerEmotions({
    super.key,
    required this.pathImages,
    required this.titleEmotions,
    required this.isSelected,
    required this.onTap,
    required this.additionalTexts,
  });

  @override
  ContainerEmotionsState createState() => ContainerEmotionsState();
}

class ContainerEmotionsState extends State<ContainerEmotions> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 83,
        height: 118,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(76),
          border: widget.isSelected
              ? Border.all(color: Colors.orange, width: 3)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(widget.pathImages),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.titleEmotions,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
