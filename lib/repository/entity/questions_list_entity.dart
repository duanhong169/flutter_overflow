import 'question_entity.dart';

class QuestionsListEntity {
  final bool hasMore;
  final List<QuestionEntity> questions;

  QuestionsListEntity(this.hasMore, this.questions);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is QuestionsListEntity &&
              runtimeType == other.runtimeType &&
              hasMore == other.hasMore &&
              questions == other.questions;

  @override
  int get hashCode =>
      hasMore.hashCode ^
      questions.hashCode;

  static QuestionsListEntity fromJson(Map<String, dynamic> json) {
    List jsonItems = json["items"];
    List<QuestionEntity> items = jsonItems.map((item) => QuestionEntity.fromJson(item)).toList();
    return QuestionsListEntity(
      json["has_more"] as bool,
      items,
    );
  }
}