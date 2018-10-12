class QuestionEntity {
  final int score;
  final String title;

  QuestionEntity(this.score, this.title);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is QuestionEntity &&
              runtimeType == other.runtimeType &&
              score == other.score &&
              title == other.title;

  @override
  int get hashCode =>
      score.hashCode ^
      title.hashCode;

  static QuestionEntity fromJson(Map<String, dynamic> json) {
    return QuestionEntity(
      json["score"] as int,
      json["title"] as String,
    );
  }
}