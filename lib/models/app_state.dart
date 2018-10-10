import 'package:meta/meta.dart';

@immutable
class AppState {
  final bool isLoading;
  final String selectedSortType;

  AppState({
    this.isLoading = false,
    this.selectedSortType = "activity"
  });

  factory AppState.loading() => AppState(isLoading: true);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading &&
              selectedSortType == other.selectedSortType;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      selectedSortType.hashCode;
}