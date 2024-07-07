import 'package:flutter/material.dart';
import 'package:emotions_diary/utils/custom_colors.dart';

class CustomSlider extends StatefulWidget {
  final String titleLevel;
  final String titleStart;
  final String titleEnd;


  const CustomSlider({
    super.key,
    required this.titleLevel,
    required this.titleStart,
    required this.titleEnd,
  });

  @override
  CustomSliderState createState() => CustomSliderState();
}

class CustomSliderState extends State<CustomSlider> {
  double _value = 50.0;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
            widget.titleLevel,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        const SizedBox(height: 20),
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13.0,),
        ),

          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 20, left: 12, right: 12),
            child: Column(
              children: [
                const IndicatorBars(),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 6.0,
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 18.0,
                    ),
                    activeTrackColor: CustomColors.tangerineColor,
                    inactiveTrackColor: CustomColors.gray5,
                    thumbColor: CustomColors.tangerineColor,
                    trackShape: CustomTrackShape(),
                  ),
                  child: Slider(
                    value: _value,
                    min: 0.0,
                    max: 100.0,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.titleStart,
                    style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(widget.titleEnd,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
        ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class IndicatorBars extends StatelessWidget {


  const IndicatorBars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double interval = (MediaQuery.of(context).size.width - 16 -16 - 24 - 2 * 6 ) / 5 ;
    return Row(
      children: [
        Container(
          height: 8,
          width: 2,
          decoration: BoxDecoration(
            color: CustomColors.gray5,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        SizedBox(height: 8, width: interval),
        Container(
          height: 8,
          width: 2,
          decoration: BoxDecoration(
            color: CustomColors.gray5,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        SizedBox(height: 8, width: interval),
        Container(
          height: 8,
          width: 2,
          decoration: BoxDecoration(
            color: CustomColors.gray5,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        SizedBox(height: 8, width: interval),
        Container(
          height: 8,
          width: 2,
          decoration: BoxDecoration(
            color: CustomColors.gray5,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        SizedBox(height: 8, width: interval),
        Container(
          height: 8,
          width: 2,
          decoration: BoxDecoration(
            color: CustomColors.gray5,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        SizedBox(height: 8, width: interval),
        Container(
          height: 8,
          width: 2,
          decoration: BoxDecoration(
            color: CustomColors.gray5,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ],
    );
  }
}
