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
    return QuestionsListEntity(
      json["has_more"] as bool,
      json["items"] as List<QuestionEntity>,
    );
  }
}