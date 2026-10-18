import 'package:flutter/material.dart';
import 'package:flutter_course/counter_app/second_page.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Тапшырма 1",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(count: count),
                    ),
                  );
                  // handle on tap here
                },
                child: Container(
                  width: double.infinity,

                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),

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
              const SizedBox(height: 20),
              // Бул жерде азайтып жана кошуп туруучу баскычтар жасалды
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 70,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          count--;
                        });
                      },
                      child: const Text("-", style: TextStyle(fontSize: 24)),
                    ),
                  ),
                  const SizedBox(width: 30),

                  SizedBox(
                    width: 70,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          count++;
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
