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

  Map<String, Object> toJson() {
    return {
      "score": score,
      "title": title,
    };
  }

  static QuestionEntity fromJson(Map<String, Object> json) {
    return QuestionEntity(
      json["score"] as int,
      json["title"] as String,
    );
  }
}