import 'package:flutter_overflow/models/models.dart';

class SelectSortTypeAction {
  final String sortType;

  SelectSortTypeAction(this.sortType);
}

class LoadQuestionsAction {}

class QuestionsLoadedAction {
  final List<Question> questions;

  QuestionsLoadedAction(this.questions);
}

class QuestionsNotLoadedAction {}