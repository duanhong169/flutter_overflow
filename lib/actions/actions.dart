import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/constants.dart';
import 'dart:async';
import 'package:meta/meta.dart';

class SelectSortTypeAction {
  final String sortType;

  SelectSortTypeAction(this.sortType);
}

class LoadQuestionsAction {
  Map<String, dynamic> params;
  final Completer completer;

  LoadQuestionsAction(this.params, this.completer);

  LoadQuestionsAction.params({int page = 1, String sortType = "active", Completer completer})
      : this.completer = completer ?? Completer() {
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
  final bool append;

  QuestionsLoadedAction(this.questions, {this.append = true});
}

class QuestionsNotLoadedAction {}