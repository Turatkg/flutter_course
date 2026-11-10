import 'package:flutter/material.dart';
import 'package:flutter_course/quiz_app/quiz_button.dart';

import 'quiz_data.dart';

// StatefulWidget - биз тест менен иштеп жатканда, туура же ката деген баскычтарды баскан сайын, экранда маалымат жаңыланып турганы үчүн, ушул виджетти колдонобуз.

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Учурдагы суроонун индекси (Индекс программалоодо дайыма 0 дөн башталат)
  int questionIndex = 0;

  // Туура жооптордун жалпы саны
  int correctAnswersCount = 0;

  // эң ылдый тараптагы жооптордун туура же ката экенин көрсөтүүчү белгилер
  // Туура жооп үчүн жашыл галочка чыгат
  // Ката жооп үчүн кызыл х белгиси чыгат

  List<Widget> scoreKeeper = [];

  // Колдонуучунун жообунун ката же туура экенин текшерүүчү логика
  // userPickedAnswer - колдонуучу баскан жооп true - Туура, false - Ката

  void checkAnswer(bool userPickedAnswer) {
    // Учурдагы суроонун туура жообун текшеребиз
    final bool correctAnswer = quizQuestions[questionIndex].answer;
    final bool isCorrect = (userPickedAnswer == correctAnswer);

    setState(() {
      // Эгер жооп туура болсо жашыл галочка, ката болсо кызыл крестик кошобуз.
      if (isCorrect) {
        correctAnswersCount++;
        scoreKeeper.add(
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Icon(Icons.check, color: Color(0xff4CB050), size: 16),
          ),
        );
      } else {
        scoreKeeper.add(
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Icon(Icons.check, color: Color(0xffEF443A), size: 16),
          ),
        );
      }
      // Эгер азыр жооп берип жатканыбыз акыркы суроо эмес болсо, кийинки суроого өтөбүз.
      if (questionIndex < quizQuestions.length - 1) {
        questionIndex++;
      }
    });

    // Бардык суроолор бүткөндө жыйынтык терезесин ачабыз.
    if (scoreKeeper.length == quizQuestions.length) {
      // Жыйынтык терезеси ачылганга чейин, акыркы белги дагы көрүнүшү керек.
      Future.delayed(const Duration(microseconds: 300), () {
        if (mounted) {
          showResultDialog();
        }
      });
    }
  }

  // Тест бүткөндө чыга турган терезе

  void showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // муну фолс кылып койбосо чыккан терезе экрандын баарын жаап калат.

      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Тест аягына чыкты',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Сиздин жыйынтык: $correctAnswersCount / ${quizQuestions.length}\n\n'
            '${correctAnswersCount >= (quizQuestions.length / 2) ? "Азаматсыз, эң жакшы көрсөткүч!" : "Жакшы, дагы бир жолу аракет кылып көрүңүз"}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2563eb),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context); // Диалог терезени жабуу
                // Буга чейин болгон иш аракеттин баарын кайра башына түшүрүп салабыз (Reset)
                setState(() {
                  questionIndex = 0;
                  correctAnswersCount = 0;
                  scoreKeeper.clear();
                });
              },
              child: const Text(
                'Кайра баштоо',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Жалпы экрандын фонун өзгөртүү үчүн
      backgroundColor: const Color(0xff333333),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Quiz App - Тапшырма 7',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Суроонун тексттери келет
            // Expanded - суроонун текстти жайгашкан жерге бир аз көбүрөөк орун беребиз. Себеби суроонун текстти көбүрөөк болуп калса батпай калбашы керек.

            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    quizQuestions[questionIndex].questionText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
            ),

            // Бул биздин туура же ката деген баскычтардын виджети, аны quiz_button.dart файлына жазылган өзүбүздүн виджеттен чакырып келип иштеттик.
            Expanded(
              flex: 2,

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: QuizButton(
                  text: 'Туура',
                  color: Color(0xff4CB050),
                  onPressed: () => checkAnswer(true),
                ),
              ),
            ),
            Expanded(
              flex: 2,

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: QuizButton(
                  text: 'Ката',
                  color: Color(0xffEF443A),
                  onPressed: () => checkAnswer(false),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Жооптордун туура же ката экенин билдирип тура турган белгилер чыгат.
            Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 12),

              alignment: Alignment.bottomLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: scoreKeeper),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
