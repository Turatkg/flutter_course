import 'package:flutter/material.dart';

// Өзбүздүн жеке баскыч виджетибиз
// Эмне үчүн өзүнчө виджет кылып алышыбыз керек. Бир виджетти өзгөртүү менен биздин бардык баскычтарды башкара алабыз.
// DRY - эрежесине ылайык болушу керек. Кодду азайтат, башкарууну жеңил кылат.

class QuizButton extends StatelessWidget {
  // Туура же Ката деген текстти сөзсүз сурашы үчүн ушул стриң түзүлдү
  final String text;
  // Баскычтын арткы фонун өзгөртүү үчүн сөзсүз Колор сурайт.
  final Color color;

  // Баскыч басылганда аткарылуучу функция сөзсүз болушу керек.
  final VoidCallback onPressed;

  const QuizButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
