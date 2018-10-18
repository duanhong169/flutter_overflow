import 'package:flutter_overflow/models/models.dart';
import 'package:flutter_overflow/enums/load_more_item_status.dart';

bool isLoadingQuestionsSelector(AppState state) => state.isLoadingQuestions;

LoadMoreItemStatus loadMoreStatusSelector(AppState state) => state.isLoadingMoreQuestions ? LoadMoreItemStatus.LOADING : LoadMoreItemStatus.NORMAL;