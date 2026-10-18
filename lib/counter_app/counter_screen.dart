import 'package:flutter/material.dart';
import 'package:flutter_course/counter_app/second_page.dart';

// StatefulWidget - абалы (ичиндеги маалыматтары, сандары) өзгөрүп туруучу экрандар үчүн колдонулат.
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // Эсептегичтин баштапкы мааниси. Биз көргөн 0 саны дал ушул өзгөрмөдөн келип чыгат.
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // Scaffold - экрандын негизги каркасы (базалык түзүлүшү)
    return Scaffold(
      // AppBar - мобилдик колдонмонун үстүндөгү шапкасын (header) жасай турган жер
      appBar: AppBar(
        title: const Text(
          "Тапшырма 1",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true, // Шапкадагы жазууну ортого жайгаштыруу
      ),
      // body - экрандын негизги ички бөлүгү
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          // Column - ичиндеги виджеттерди өйдөдөн ылдыйга (вертикалдуу) тизет
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // GestureDetector - каалаган элементти баскычка айлантуучу виджет.
              // Бул жерде "Сан: 0" контейнери басыла турган баскыч кылып өзгөртүлдү.
              GestureDetector(
                onTap: () {
                  // Басылганда кийинки экинчи бетке (SecondPage) өтүү
                  // жана учурдагы count (сан) маанисин кошо берип жиберүү
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(count: count),
                    ),
                  );
                },
                // Сан жазылган блок (контейнер)
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  // Блоктун жасалгасы: өңү жана бурчтарынын тегеректиги
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  // Эсептегичтин санын көрсөтүүчү текст ($count аркылуу сан келет)
                  child: Text(
                    "Сан: $count",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Контейнер менен баскычтардын ортосундагы боштук (аралык)

              // Row - баскычтарды туурасынан (горизонталдуу) бир катарга тизет
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // 1) Санды 1ге азайтуучу минус баскычы (-) ушул жерден жасалды
                  SizedBox(
                    width: 70,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // setState - сан өзгөргөнүн экранга билдирип, экрандагы маалыматты жаңылайт (кайра тартат)
                        setState(() {
                          count--; // Санды 1ге азайтуу
                        });
                      },
                      child: const Text("-", style: TextStyle(fontSize: 24)),
                    ),
                  ),
                  const SizedBox(width: 30), // Эки баскычтын ортосундагы боштук

                  // 2) Санды 1ге көбөйтүүчү плюс баскычы (+) ушул жерден жасалды
                  SizedBox(
                    width: 70,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // setState - сан өзгөргөнүн экранга билдирип, экрандагы маалыматты жаңылайт (кайра тартат)
                        setState(() {
                          count++; // Санды 1ге көбөйтүү
                        });
                      },
                      child: const Text("+", style: TextStyle(fontSize: 24)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

