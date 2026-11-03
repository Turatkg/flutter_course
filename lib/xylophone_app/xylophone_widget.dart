import 'package:flutter/material.dart';

class XylophoneWidget extends StatelessWidget {
  // Баскычтын түсүн ушуну менен белгилейбиз
  final Color color;

  // Ар бир баскычты басканда үч чыгара турган функцияны ушуга жасайбыз.
  final VoidCallback onTap;

  const XylophoneWidget({super.key, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Expanded виджети тигинен берилген нерселерди бирдей кылып жайгаштырат

    // бардык 7 баскычка экранды бирдей кылып бөлүп берет

    return Expanded(
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.white30,
          highlightColor: Colors.white10,
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}
