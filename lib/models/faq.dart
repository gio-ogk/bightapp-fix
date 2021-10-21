class FAQ {
  String question;
  String answer;

  FAQ({
    required this.question,
    required this.answer
  });

  factory FAQ.fromDatabaseJson(Map<String, dynamic> faqMap) => FAQ(
    question: faqMap['title']['rendered'],
    answer: faqMap['answer'],
  );
}