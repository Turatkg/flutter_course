// =============================================================================
// СУРООЛОР ЖАНА МОДЕЛЬ ФАЙЛЫ (QUIZ DATA & MODEL)
// =============================================================================

/// Question классы — бул ар бир суроонун чертёжу (калыбы).
/// Анын эки гана касиети бар:
/// 1. questionText - суроонун тексти (String)
/// 2. answer - туура же ката экендиги (bool: true же false)
class Question {
  final String questionText;
  final bool answer;

  const Question({required this.questionText, required this.answer});
}

/// Бул тизмеден суроолор кезек менен экранга чыгарылып турат.
const List<Question> quizQuestions = [
  Question(questionText: 'Кыргызстанда 7 область бар', answer: true),
  Question(questionText: 'Бишкек шаары 1878-жылы негизделген', answer: true),
  Question(
    questionText: 'Ысык-Көл дүйнөдөгү эң терең көл',
    answer: false, // Туура эмес: Дүйнөдөгү эң терең көл — Байкал
  ),
  Question(
    questionText: 'Кыргызстандын эң бийик чокусу — Жеңиш чокусу (7439 м)',
    answer: true,
  ),
  Question(
    questionText: 'Сулайман-Тоо Бишкек шаарында жайгашкан',
    answer: false, // Туура эмес: Сулайман-Тоо Ош шаарында жайгашкан
  ),
  Question(
    questionText: 'Кыргызстандын туусунда 40 күн нуру чагылдырылган',
    answer: true, // 40 байыркы кыргыз уруусун билдирет
  ),
  Question(
    questionText: 'Кыргызстанда темир жол каттамы жок',
    answer: false, // Туура эмес: Кыргызстанда темир жол каттамы бар
  ),
  Question(
    questionText: 'Манас эпосу дүйнөдөгү эң чоң эпостордун бири',
    answer: true,
  ),
];
