import 'package:meta/meta.dart';
import 'package:flutter_overflow/models/models.dart';

@immutable
class AppState {
  final bool isLoading;
  final String selectedSortType;
  final List<Question> questions;

  AppState({
    this.isLoading = false,
    this.selectedSortType = "activity",
    this.questions = const [],
  });

  factory AppState.loading() => AppState(isLoading: true);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading &&
              selectedSortType == other.selectedSortType &&
              questions == other.questions;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      selectedSortType.hashCode ^
      questions.hashCode;
}