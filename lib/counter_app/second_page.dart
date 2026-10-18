import 'package:flutter/material.dart';

// StatelessWidget - ичиндеги маалыматтары өзгөрбөгөн (статикалык) экрандар үчүн колдонулат
class SecondPage extends StatelessWidget {
  // Биринчи экрандан (CounterScreen) жөнөтүлгөн санды кабыл алуучу өзгөрмө
  final int count;

  const SecondPage({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    // Scaffold - экрандын негизги каркасы
    return Scaffold(
      // AppBar - экинчи экрандын үстүнкү шапкасы (артка кайтуу жебеси автоматтык түрдө чыгат)
      appBar: AppBar(
        title: const Text(
          'Тапшырма 2',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      // body - экрандын негизги ички бөлүгү
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          // Биринчи экрандан келген санды чагылдыруучу блок (контейнер)
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16.0),
            ),
            // Биринчи экрандан өтүп келген $count маанисин көрсөтүүчү текст
            child: Text(
              "Сан: $count",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

