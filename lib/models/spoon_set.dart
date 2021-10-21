class SpoonSet {
  int id;
  String title;
  List<String> questions;
  bool isStandardTemplate;
  SpoonSet({
    required this.id,
    required this.title,
    required this.questions,
    required this.isStandardTemplate,
  });

  factory SpoonSet.fromDatabaseJson({required Map<String, dynamic> spoonMap, required List<String> questions}) => SpoonSet(
    id: spoonMap['ID'],
    title: spoonMap['post_title'],
    questions: questions,
    isStandardTemplate: spoonMap['is_standard'],
  );
}