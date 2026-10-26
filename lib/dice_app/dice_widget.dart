import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiceWidget extends StatelessWidget {
  final int diceNumber;
  final VoidCallback onTap;
  final Color? color;

  const DiceWidget({
    super.key,
    required this.diceNumber,
    required this.onTap,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    // Expanded - виджети бир канча нерсени катары менен тизгенде ортосундагы боштукту тең бөлүп берүүчү виджет.
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ), // 2. SvgPicture виджетин Padding'дин 'child' параметрине беребиз
          child: TweenAnimationBuilder<double>(
            // diceNumber өзгөргөн сайын анимация кайра башталсын үчүн key беребиз
            key: ValueKey(diceNumber),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(
              milliseconds: 300,
            ), // Анимациянын ылдамдыгы
            builder: (context, value, child) {
              return Transform.scale(
                // Башында кичине болуп, ортого келгенде толук өлчөмүнө келет (жанлануу эффекти)
                scale: 0.5 + (0.5 * value),
                child: Transform.rotate(
                  // Кубик айланып келип түшөт (360 градус = 2 * pi)
                  angle: value * 6.28,
                  child: child,
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/dice_app/images/dice_$diceNumber.svg',
              // ignore: deprecated_member_use
              color: color, // Бул өзүбүз жасап алган ак түс!
            ),
          ),
        ),
      ),
    );
  }
}
