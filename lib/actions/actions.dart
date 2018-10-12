import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/constants.dart';

class SelectSortTypeAction {
  final String sortType;

  SelectSortTypeAction(this.sortType);
}

class LoadQuestionsAction {
  Map<String, dynamic> params;

  LoadQuestionsAction(this.params);

  LoadQuestionsAction.params({int page, String sortType}) {
    this.params = {};
    params["page"] = page;
    params["sort"] = sortType;
    params["pageSize"] = DEF_PAGE_SIZE;
    params["tagged"] = "flutter";
    params["order"] = "desc";
    params["filter"] = "!6JW7LsM8VJgxM";
  }
}

class QuestionsLoadedAction {
  final List<Question> questions;

  QuestionsLoadedAction(this.questions);
}

class QuestionsNotLoadedAction {}