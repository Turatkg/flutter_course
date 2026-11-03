import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_course/dice_app/dice_widget.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  // Оң жана сол кубиктердин баптапкы маанилери (1 жана 2)
  int rightDice = 1;
  int leftDice = 2;

  // кубиктерди рандом тандап алуу функциясы же кубиктерди ыргытуучу функция

  void kubiktiYrgyt() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffe93b),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 8,
        centerTitle: true,
        title: Text(
          'Тапшырма 5',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Row(
            children: [
              // Image.asset ордуна SvgPicture.asset колдонобуз
              DiceWidget(diceNumber: leftDice, onTap: kubiktiYrgyt),
              const SizedBox(width: 16),
              DiceWidget(diceNumber: rightDice, onTap: kubiktiYrgyt),
            ],
          ),
        ),
      ),
    ); // Негизги экрандын каркасы, бирок мунун ичи өзү бош
  }
}
