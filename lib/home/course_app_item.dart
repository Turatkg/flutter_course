import 'package:flutter/material.dart';
import 'package:flutter_course/im_rich/im_rich.dart';

import '../counter_app/counter_screen.dart';

class CourseAppItem {
  final int id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final WidgetBuilder pageBuilder;

  const CourseAppItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.pageBuilder,
  });

  static List<CourseAppItem> get courseApps => [
    CourseAppItem(
      id: 1,
      title: "Counter App",
      subtitle: "1-сабак. Эсептегич колдонмо",
      icon: Icons.add_circle_rounded,
      color: Color(0xff2563eb),
      pageBuilder: (_) => const CounterScreen(),
    ),
    CourseAppItem(
      id: 2,
      title: "I'm Rich",
      subtitle: "2-сабак. Мен баймын",
      icon: Icons.diamond_outlined,
      color: Color(0xff2563eb),
      pageBuilder: (_) => const ImRichScreen(),
    ),
    CourseAppItem(
      id: 3,
      title: "Visit Card",
      subtitle: "3-сабак. Жеке визиттик карточкаң",
      icon: Icons.badge_outlined,
      color: Color(0xff2563eb),
      pageBuilder: (_) => const CounterScreen(),
    ),
    CourseAppItem(
      id: 4,
      title: "Dice App",
      subtitle: "4-сабак. Кубик ыргытуу",
      icon: Icons.casino_outlined,
      color: Color(0xff2563eb),
      pageBuilder: (_) => const CounterScreen(),
    ),
    CourseAppItem(
      id: 5,
      title: "Xylophone App",
      subtitle: "5-сабак. Музыка чыгаруучу колдонмо",
      icon: Icons.music_note_outlined,
      color: Color(0xff2563eb),
      pageBuilder: (_) => const CounterScreen(),
    ),
    CourseAppItem(
      id: 6,
      title: "Quiz App",
      subtitle: "6-сабак. Тест викторина",
      icon: Icons.quiz_outlined,
      color: Color(0xff2563eb),
      pageBuilder: (_) => const CounterScreen(),
    ),
    CourseAppItem(
      id: 7,
      title: "BMI Calculator",
      subtitle: "7-сабак. Дене салмактын индекси",
      icon: Icons.monitor_weight_outlined,
      color: Color(0xff2563eb),
      pageBuilder: (_) => const CounterScreen(),
    ),
    CourseAppItem(
      id: 8,
      title: "The Weather App",
      subtitle: "8-сабак. Аба ырайы",
      icon: Icons.wb_sunny_outlined,
      color: Color(0xff2563eb),
      pageBuilder: (_) => const CounterScreen(),
    ),
    CourseAppItem(
      id: 9,
      title: "Flash Chat",
      subtitle: "9-сабак. Онлайн чат",
      icon: Icons.chat_bubble_outline,
      color: Color(0xff2563eb),
      pageBuilder: (_) => const CounterScreen(),
    ),
    CourseAppItem(
      id: 10,
      title: "Country Test",
      subtitle: "10-сабак. Дүйнө өлкөлөрүнүн тестти",
      icon: Icons.public_outlined,
      color: Color(0xff2563eb),
      pageBuilder: (_) => const CounterScreen(),
    ),
    CourseAppItem(
      id: 11,
      title: "News App",
      subtitle: "11-сабак. Жаңылыктар порталы",
      icon: Icons.newspaper_outlined,
      color: Color(0xff2563eb),
      pageBuilder: (_) => const CounterScreen(),
    ),
  ];
}
