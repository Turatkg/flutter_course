import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/xylophone_app/xylophone_widget.dart';

class XylophoneScreen extends StatefulWidget {
  const XylophoneScreen({super.key});

  @override
  State<XylophoneScreen> createState() => _XylophoneScreenState();
}

class _XylophoneScreenState extends State<XylophoneScreen> {
  // КАТАНЫН СЕБЕБИ: Мурун 7 нотага 1 гана AudioPlayer колдонулуп, баскан сайын
  // stop() жана play() удаа чакырылган. Ноталарды бат-баттан басканда мурунку үн
  // жүктөлүп бүтө электе stop() аны үзүп салып, плеер катып (үн чыкпай) калган.
  // ЧЕЧИМИ: Ар бир нотага өзүнчө плеер түзүп, үндөрдү алдын ала даярдап коёбуз.

  // 7 нота үчүн 7 өзүнчө аудио ойноткучтун (AudioPlayer) тизмеси
  late final List<AudioPlayer> _audioPlayers;

  // Ар бир нотанын аудио файлы толук жүктөлүп бүткөнүн көзөмөлдөөчү тизме
  late final List<Future<void>> _playerInitFutures;

  @override
  void initState() {
    super.initState();
    // Экран ачылганда 7 нотага 7 жаңы AudioPlayer түзөбүз
    _audioPlayers = List.generate(7, (_) => AudioPlayer());
    // 7 плеердин ар бирине өзүнүн нотасын алдын ала жүктөйбүз
    _playerInitFutures = List.generate(7, _preparePlayer);
  }

  // Берилген индекстеги (0..6) плеерди даярдоочу функция
  Future<void> _preparePlayer(int index) async {
    // Тизмеден керектүү плеерди алабыз
    final player = _audioPlayers[index];
    // Үн бүткөндө аудиону эстутумдан өчүрбөй, кайра ойнотууга даяр кармайт
    await player.setReleaseMode(ReleaseMode.stop);
    // Нотанын файлын (note_1.wav .. note_7.wav) плеерге алдын ала жүктөп коёбуз
    await player.setSource(AssetSource('xylophone/note_${index + 1}.wav'));
  }

  @override
  void dispose() {
    // Экран жабылганда бардык 7 плеерди өчүрүп, эстутумду (память) бошотобуз
    for (final player in _audioPlayers) {
      player.dispose();
    }
    super.dispose();
  }

  // Керектүү нотаны ойнотуучу функция (soundNumber: 1 ден 7 ге чейин)
  Future<void> playSound(int soundNumber) async {
    // Тизменин индекси 0дөн башталгандыктан, нотанын номеринен 1ди кемитебиз
    final index = soundNumber - 1;
    // Нотанын аудио файлы даяр болгонун текшеребиз
    await _playerInitFutures[index];
    // Тиешелүү нотанын плеерин алабыз
    final player = _audioPlayers[index];
    // Эгер нота ойноп жаткан болсо, үндү эң башына (0-секундага) кайтарабыз
    await player.seek(Duration.zero);
    // Нотанын үнүн дароо улантабыз (ойнотобуз)
    await player.resume();
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
