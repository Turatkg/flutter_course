import 'package:flutter/material.dart';

// Эмне үчүн биз өзүбүз жаңы Виджет түзөбүз? (DRY - Don't Repeat Yourself принциби)
// Өзүбүз виджет түзүп алсак, код кыска жана окумдуу болот. Бир файлдын ичинде толтуруп код жазбай, виджеттерди өзүнчө файлга чыгарып алабыз.

class ContactCardWidget extends StatelessWidget {
  // Виджет сырттан кабыл ала турган өзгөрмөлөр.
  final IconData icon; // карточкадагы баш жагындагы иконканы чыгаруу үчүн
  final String text; // Иконканын оң тарабындагы текст же номер.

  const ContactCardWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Icon(icon, color: Color(0xff056c5c), size: 28),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xff056c5c),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
