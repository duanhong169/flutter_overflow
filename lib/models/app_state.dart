import 'package:meta/meta.dart';
import 'package:flutter_overflow/models/models.dart';

@immutable
class AppState {
  final bool isLoadingQuestions;
  final String selectedSortType;
  final List<Question> questions;
  final bool isLoadingMoreQuestions;
  final int questionsPage;

  AppState({
    this.isLoadingQuestions = false,
    this.selectedSortType = "activity",
    this.questions = const [],
    this.isLoadingMoreQuestions = false,
    this.questionsPage = 0
  });

  factory AppState.loadingQuestions() => AppState(isLoadingQuestions: true);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              isLoadingQuestions == other.isLoadingQuestions &&
              selectedSortType == other.selectedSortType &&
              questions == other.questions;

  @override
  int get hashCode =>
      isLoadingQuestions.hashCode ^
      selectedSortType.hashCode ^
      questions.hashCode;
}