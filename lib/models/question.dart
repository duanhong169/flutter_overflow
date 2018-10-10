import 'package:meta/meta.dart';
import 'package:flutter_overflow/repository/stack_overflow_repository.dart';

@immutable
class Question {
  final int score;
  final String title;

  Question(this.score, this.title);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Question &&
              runtimeType == other.runtimeType &&
              score == other.score &&
              title == other.title;

  @override
  int get hashCode =>
      score.hashCode ^
      title.hashCode;

  QuestionEntity toEntity() {
    return QuestionEntity(score, title);
  }

  static Question fromEntity(QuestionEntity entity) {
    return Question(entity.score, entity.title);
  }
}