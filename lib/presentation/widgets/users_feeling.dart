import 'package:flutter/material.dart';
import 'package:emotions_diary/utils/custom_icon.dart';
import 'package:emotions_diary/presentation/widgets/container_emotions.dart';
import 'package:emotions_diary/utils/app_title.dart';
import 'package:emotions_diary/utils/custom_colors.dart';

class UsersFeeling extends StatefulWidget {
  final VoidCallback onUpdate;

  const UsersFeeling({
    super.key,
    required this.onUpdate,
  });

  @override
  UsersFeelingState createState() => UsersFeelingState();
}

class UsersFeelingState extends State<UsersFeeling> {
  String? selectedEmotion;
  bool showAdditionalTexts = false;
  Set<int> selectedAdditionalTextIndices = {};

  final Map<String, List<String>> additionalTextsMap = {
    AppTitle.joyTitle: [
      'Возбуждение', 'Восторг', 'Игривость', 'Наслаждение',
      'Очарование', 'Осознанность', 'Смелость', 'Удовольствие', 'Чувственность',
      'Энергичность', 'Экстравагантность'
    ],
    AppTitle.fearTitle: ['Тревога', 'Беспокойство', 'Страх', 'Паника'],
    AppTitle.rabiesTitle: ['Раздражение', 'Гнев', 'Ярость', 'Агрессия'],
    AppTitle.sadnessTitle: ['Грусть', 'Печаль', 'Отчаяние', 'Уныние'],
    AppTitle.calmnessTitle: ['Спокойствие', 'Умиротворение', 'Расслабление', 'Гармония'],
    AppTitle.powerTitle: ['Энергия', 'Мощь', 'Уверенность', 'Целеустремленность'],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text(
          AppTitle.usersFeel,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 118,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildEmotionContainer(AppTitle.joyTitle, CustomIcon.joyIcon2),
                _buildEmotionContainer(AppTitle.fearTitle, CustomIcon.fearIcon2),
                _buildEmotionContainer(AppTitle.rabiesTitle, CustomIcon.rabiesIcon2),
                _buildEmotionContainer(AppTitle.sadnessTitle, CustomIcon.sadnessIcon2),
                _buildEmotionContainer(AppTitle.calmnessTitle, CustomIcon.calmnessIcon2),
                _buildEmotionContainer(AppTitle.powerTitle, CustomIcon.powerIcon2),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10), // Adjust spacing as needed
        if (selectedEmotion != null && selectedAdditionalTextIndices.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Выберите хотя бы одно чувство',
              style: TextStyle(color: Colors.red),
            ),
          ),
        const SizedBox(height: 20),
        if (showAdditionalTexts && selectedEmotion != null && additionalTextsMap.containsKey(selectedEmotion))
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              additionalTextsMap[selectedEmotion]!.length,
                  (index) {
                final text = additionalTextsMap[selectedEmotion]![index];
                final isSelected = selectedAdditionalTextIndices.contains(index);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedAdditionalTextIndices.remove(index);
                      } else {
                        selectedAdditionalTextIndices.add(index);
                      }
                    });
                    widget.onUpdate(); // Обновляем состояние в родительском виджете
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? CustomColors.tangerineColor : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      text,
                    ),
                  ),
                );
              },
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEmotionContainer(String emotion, String path) {
    return ContainerEmotions(
      pathImages: path,
      titleEmotions: emotion,
      isSelected: selectedEmotion == emotion,
      additionalTexts: additionalTextsMap[emotion] ?? [],
      onTap: () {
        setState(() {
          selectedEmotion = emotion;
          showAdditionalTexts = true;
          selectedAdditionalTextIndices.clear();
        });
        widget.onUpdate(); // Обновляем состояние в родительском виджете
      },
    );
  }
}
