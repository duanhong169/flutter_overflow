import 'package:flutter/material.dart';
import 'package:flutter_overflow/containers/app_loading.dart';
import 'loading_indicator.dart';
import 'question_item.dart';
import 'package:flutter_overflow/models/models.dart';

class QuestionList extends StatelessWidget {

  final List<Question> questions;

  QuestionList(this.questions);

  @override
  Widget build(BuildContext context) {
    return AppLoading(builder: (context, loading) {
      return loading
          ? LoadingIndicator(key: Key('__questionsLoading__'))
          : _buildListView();
    });
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions[index];

        return QuestionItem(
          question: question,
          onTap: () => _onQuestionTap(context, question),
        );
      },
    );
  }

  void _onQuestionTap(BuildContext context, Question question) {

  }
}