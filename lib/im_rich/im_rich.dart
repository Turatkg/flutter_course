import 'package:flutter/material.dart';

// Бул бетте Counter App сыяктуу сан же бир нерсе өзгөрбөгөнү үчүн, жөн гана сүрөт жана коз экран болгондуктан StatelessWidget жетиштүү.
class ImRichScreen extends StatelessWidget {
  const ImRichScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold Widget - бул экрандын негизги каркасын түзүп берүүчү виджет.
    return Scaffold(
      backgroundColor: const Color(0xffecb90b),
      appBar: AppBar(
        backgroundColor: Color(0xffecb90b),
        centerTitle: true,
        elevation: 20.0, // AppBar дагы көлөкөнүн размери
        shadowColor: Colors.black87, //AppBar дагы көлөкөнүн түсү, түсү болбосо көлөкө өзү иштебейт.
        title: Text(
          "Тапшырма 3",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            // АппБардагы тексттин өңү
          ),
        ),
      ),

      body:
          // Center виджети ичиндеги бардык маалыматтарды эакрандын так ортосуна жайгаштырат.
          Center(
            child:
                // Экрандагы маалыматтарды тикесинен өйдөдөн ылдый карай жайгаштырат
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "I'm Rich",
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.black,
                        fontFamily: 'Sofia',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // Бул SizedBox виджети текст менен алмаздын ортосун бөлүп турууга колдонулду

                    // Бул SizedBox - виджети биздин алмаз сүрөтүнүн размерин бузбай көрсөтүү үчүн колдонулду
                    SizedBox(
                      width: 300,
                      height: 350,
                      child: Image.asset(
                        'assets/im_rich/images/diamond.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
          ),
    );
  }
}
