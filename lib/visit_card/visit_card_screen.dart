import 'package:flutter/material.dart';
import 'package:flutter_course/visit_card/contact_card_widget.dart';

class VisitCardScreen extends StatelessWidget {
  const VisitCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold - экрандын каркасы, бош экрандын түзүлүшү
    return Scaffold(
      // экрандын негизги арткы фону
      backgroundColor: const Color(0xff056c5c),

      appBar: AppBar(
        // Колдонмонун шапкесинин фону, бул ак түстө
        backgroundColor: Colors.white,
        elevation: 0, // AppBarдын көлөкөсүн алып салуу үчүн 0 колдонулат.
        centerTitle: true, //AppBarдагы текстти ортого алабыз.
        title: const Text(
          'Тапшырма 4',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),

      // body - экрандын ички негизги бөлүгү
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/visit_card/images/logo.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              "Turat Alybaev",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Pacifico',
              ),
            ),

            const Text(
              "Flutter Developer",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 6, bottom: 24),
              height: 1.5,
              width: 220,
              color: Colors.white,
            ),

            const ContactCardWidget(
              icon: Icons.phone_outlined,
              text: '0 227 123 456',
            ),
            const SizedBox(height: 20),
            const ContactCardWidget(
              icon: Icons.mail_outlined,
              text: 'turat@appitc.com',
            ),
          ],
        ),
      ),
    );
  }
}
