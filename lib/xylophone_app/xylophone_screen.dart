import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/xylophone_app/xylophone_widget.dart';

class XylophoneScreen extends StatefulWidget {
  const XylophoneScreen({super.key});

  @override
  State<XylophoneScreen> createState() => _XylophoneScreenState();
}

class _XylophoneScreenState extends State<XylophoneScreen> {
  // Audio ойнотуучу ойноткуч жасайбыз (Audioplayer)
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // Xylophone дун керектүү нотасын ойнотуучу функция
  // SoundNumber - 1 ден 7 ге чейин нотанын номери

  Future<void> playSound(int soundNumber) async {
    // Эгер бизде мурда бир нота басылып, анын үнү өчө элек болсо, аны өчүрүп анан дароо басылган нотанын үнүн иштетебиз.
    await _audioPlayer.stop();
    // AssetsSource аркылуу биздин ассетс папкадан үндөрдү алып, иштетет.
    await _audioPlayer.play(AssetSource('xylophone/note_$soundNumber.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2b2b),
      appBar: AppBar(
        // AppBar виджети колдонмонун үстүндөгү тема жазыла турган жерди түзүп берет.
        backgroundColor: const Color(0xff2b2b2b),
        elevation: 0,
        centerTitle: true,
        title: Text(
          // Бул Текст виджет АппБардагы жазууну курууга колдонулат.
          'Xylophone App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment:
              /* CrossAxisAlignment.stretch касиети — бул багыттоочу виджеттердин (мисалы, Column же Row) ичиндеги элементтерди туурасынан же узунунан толук созуп (толтуруп) жайгаштыруу үчүн колдонулат */
              CrossAxisAlignment.stretch,
          children: [
            // Ноталарды ушул жерге өзүбүз түзгөн виджеттен чакырып алабыз.
            // 1-нота (Кызыл)
            XylophoneWidget(
              color: const Color(0xffef4020),
              onTap: () => playSound(1),
            ),
            XylophoneWidget(
              color: const Color(0xfff97316),
              onTap: () => playSound(2),
            ),
            XylophoneWidget(
              color: const Color(0xfffacc15),
              onTap: () => playSound(3),
            ),
            XylophoneWidget(
              color: const Color(0xff22c55e),
              onTap: () => playSound(4),
            ),
            XylophoneWidget(
              color: const Color(0xff0d9488),
              onTap: () => playSound(5),
            ),
            XylophoneWidget(
              color: const Color(0xff3b82f6),
              onTap: () => playSound(6),
            ),
            XylophoneWidget(
              color: const Color(0xfff933ea),
              onTap: () => playSound(7),
            ),
          ],
        ),
      ),
    );
  }
}
