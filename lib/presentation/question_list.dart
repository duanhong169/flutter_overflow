import 'package:flutter/material.dart';
import 'package:flutter_overflow/containers/app_loading.dart';
import 'loading_indicator.dart';
import 'question_item.dart';
import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/containers/managed_list_view.dart';
import 'package:flutter_overflow/helpers.dart';

class QuestionList extends StatelessWidget {

  final List<Question> questions;
  final LoadMoreCallback onLoadMore;

  QuestionList(this.questions, this.onLoadMore);

  @override
  Widget build(BuildContext context) {
    return AppLoading(builder: (context, loading) {
      return loading
          ? LoadingIndicator(key: Key('__questionsLoading__'))
          : _buildListView();
    });
  }

  ManagedListView _buildListView() {
    return ManagedListView(
      itemCount: questions.length,
      builder: (BuildContext context, int index) {
        final question = questions[index];

        return QuestionItem(
          question: question,
          onTap: () => _onQuestionTap(context, question),
        );
      },
      onLoadMore: this.onLoadMore,
    );
  }

  void _onQuestionTap(BuildContext context, Question question) {

  }
}